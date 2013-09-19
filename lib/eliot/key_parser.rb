module Eliot
  class KeyParser
    def initialize(keys, options = {})
      @keys = keys
      @separator = options.fetch(:separator, ':')
    end

    def parse
      @keys.map { |pair|
        raw_key, key = pair.split(@separator, 2)
        key = raw_key if key.nil? || key == ''

        [raw_key, key]
      }
    end
  end
end
