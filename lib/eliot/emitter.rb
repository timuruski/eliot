require 'stringio'

module Eliot
  class Emitter
    include Enumerable

    def initialize
      @sources = []
      @enumerator = Fiber.new do
        sources.each do |source|
          source = StringIO.new(source)
          source.each do |item|
            Fiber.yield item
          end
        end
        raise StopIteration
      end
    end

    attr_reader :sources

    def load(source)
      @sources << source
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
  end
end
