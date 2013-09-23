require 'forwardable'
require 'eliot/emitter'
require 'eliot/converter'

module Eliot
  class Pipeline
    extend Forwardable
    include Enumerable

    def initialize(emitter = nil, converter = nil)
      @emitter = emitter || Emitter.new
      @converter = converter || Converter.new(@emitter)
    end

    def load(*args)
      self
    end

    def load_files(*args)
      self
    end

    def on(key, &block)
      self
    end

    def each(&block)
      # fiber loop
      #   get value from emitter
      #   pass through converter
      #   yield
    end
  end
end
