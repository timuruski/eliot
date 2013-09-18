require 'eliot/key_extractor'

module Eliot
  class BaseExtractor
    include Enumerable

    def initialize(*args)
      @sources = []
      # extract options
      # parse fields
      #
      # setup emitter
      # setup record converter factory
    end

    def on(field, &block)
      self
    end

    def load(*sources)
      self
    end

    def next
    end

    def each
    end

  end
end
