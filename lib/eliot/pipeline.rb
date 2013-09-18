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

    def each
      []
    end

    def_delegators :emitter, :load, :load_files
    def_delegators :transformer, :each, :on
  end
end
