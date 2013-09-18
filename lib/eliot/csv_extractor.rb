require 'eliot/base_extractor'
require 'csv'

module Eliot
  class CSVExtractor < BaseExtractor
    def load(source)
      @sources
    end

    def parse(data, opts = {})
      # entries = []
      csv_opts = { :headers => true }.merge(opts)
      entries = CSV.new(data, csv_opts).map { |row|
        entry = @key_extractor.to_entry(row)
        load(entry)
      }
    end
  end
end
