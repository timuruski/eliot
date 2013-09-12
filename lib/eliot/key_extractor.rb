require 'eliot/entry'

module Eliot
  class KeyExtractor
    def initialize(keys)
      @keys = keys
    end

    def to_entry(row)
      data = row.map
        .with_index { |(h,v),i| extract(h,v,i) }
        .reject(&:empty?)

      Entry.new(Hash[data])
    end

    def extract(header, value, index)
      key = @keys.fetch(index)
      case key
      when :*, :_, nil
        []
      else
        [key, value]
      end
    end
  end
end
