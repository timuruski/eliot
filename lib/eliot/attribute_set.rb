require 'forwardable'

module Eliot
  class AttributeSet
    extend Forwardable
    def_delegators :@attrs, :[], :[]=

    def initialize(hash)
      @attrs = hash.dup
    end

    def to_h
      @attrs.dup
    end

    # Returns a Proc that will assign all attributes to a target.
    # This is convenient for ActiveModel records.
    def to_proc
      Proc.new do |target|
        @attrs.each do |key, value|
          target.send(:"#{key}=", value)
        end
      end
    end
    alias_method :assign, :to_proc

  end
end
