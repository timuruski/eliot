require 'csv'

require 'eliot'

module Eliot
  def self.csv(*args)
    emitter = CSVEmitter.new
    keys = KeyParser.new(args).parse
    converter = CSVConverter.new(converter, keys)

    Pipeline.new(emitter, converter)
  end

  class CSVEmitter < Emitter
  end

  class CSVConverter < Converter
  end
end
