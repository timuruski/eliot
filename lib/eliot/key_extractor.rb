require 'eliot/entry'

module Eliot
  class KeyExtractor
    def initialize(keys)
      @keys = keys
      @key_transforms = Hash.new { |h,k| h[k] = [] }
    end

    def on_key(key, &block)
      @key_transforms[key] << block
    end

    def to_entry(row)
      data = row.map
        .with_index { |(h,v),i| extract(h,v,i) }
        .reject(&:empty?)

      Entry.new(Hash[data])
    end

    def extract(header, value, index)
      key = @keys.fetch(index)
      return [] if skip_key? key

      value = transform_value(key, value)

      [key, value]
    end

    def skip_key?(key)
      key.nil? || key == :_ || key == :*
    end

    def transform_value(key, value)
      @key_transforms.fetch(key, []).each do |block|
        value = block.call(value)
      end

      value
    end
  end
end
