module Eliot
  class KeySet
    DEFAULT_SEPARATOR = ':'.freeze

    def initialize(source, options = {})
      separator = options.fetch(:separator, DEFAULT_SEPARATOR)
      @key_pairs = parse(source, separator)
    end

    def each(&block)
      @key_pairs.each(&block)
    end

    protected

    # TODO Maybe handle nested arrays.
    def parse(source, separator)
      source.map { |pair|
        raw_key, key = pair.split(separator, 2)
        key = raw_key if key.nil? || key == ''

        [raw_key, key]
      }
    end
  end
end
