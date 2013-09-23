require 'stringio'
require 'pathname'

module Eliot
  class Emitter
    include Enumerable

    def initialize
      @sources = []
      @enumerator = Fiber.new do
        sources.each do |source|
          source.each do |item|
            Fiber.yield item
          end
        end
        raise StopIteration
      end
    end

    attr_reader :sources

    ReadableFile = ->(source) { Pathname.new(source).readable? }

    def load(source)
      @sources << to_io(source)
    end

    def each
      loop do
        yield self.next
      end
    rescue StopIteration
    end

    def next
      @enumerator.resume
    end

    protected

    def to_io(source)
      case source
      when StringIO, IO
        source
      when Pathname, ReadableFile
        File.open(source)
      else
        StringIO.new(source)
      end
    end
  end
end
