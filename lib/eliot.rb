require 'eliot/base_extractor'
require 'eliot/csv_extractor'

module Eliot
  def self.csv
    CSVExtractor.new
  end

  # TODO JSON, YAML extractors?
end
