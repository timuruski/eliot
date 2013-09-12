require 'eliot/key_extractor'

module Eliot
  class BaseExtractor
    DEFAULT_LOAD_PROC = Proc.new { |entry| entry }

    def initialize
      @load_proc = DEFAULT_LOAD_PROC
    end

    def extract(*keys)
      self
    end

    def into(&block)
      @load_proc = Proc.new(&block)
      self
    end

    def parse(path)
      []
    end
  end
end
