require 'spec_helper'

describe KeyParser, '#parse' do
  context "with default separator" do
    it "parses single values into a mapping pair" do
      mapping = %w[id]
      keys = KeyParser.new(mapping).parse
      expect(keys).to eq([ ['id', 'id'] ])
    end

    it "parses paired values into a mapping pair" do
      mapping = %w[ID:id]
      keys = KeyParser.new(mapping).parse
      expect(keys).to eq([ ['ID', 'id'] ])
    end

    it "parses incomplete values into a mapping pair" do
      mapping = %w[ID:]
      keys = KeyParser.new(mapping).parse
      expect(keys).to eq([ ['ID', 'ID'] ])
    end

    it "parses multiple values into mapping pairs" do
      mapping = %w[ID:id Email:email]
      keys = KeyParser.new(mapping).parse
      expect(keys).to eq([ ['ID', 'id'],
                           ['Email', 'email'] ])
    end
  end

  context "with a custom sepator" do
    it "splits on the separator" do
      mapping = %w[user:id=>id]
      keys = KeyParser.new(mapping, separator: '=>').parse

      expect(keys).to eq([ ['user:id', 'id'] ])
    end
  end
end
