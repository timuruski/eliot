require 'eliot/base_extractor'
require 'csv'

module Eliot
  class CSVExtractor < BaseExtractor
    def parse(data, opts = {})
      # entries = []
      csv_opts = { :headers => true }.merge(opts)
      entries = CSV.new(data, csv_opts).map { |row|
        entry = @key_extractor.to_entry(row)
        load(entry)
      }
    end

    def extract(*keys)
      @key_extractor = KeyExtractor.new(keys)
      self
    end

    def extract_entry(row)
    end

    def load(entry)
      @load_proc.call(entry)
    end
  end
end
