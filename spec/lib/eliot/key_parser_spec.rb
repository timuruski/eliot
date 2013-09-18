require 'spec_helper'
require 'eliot/key_parser'

module Eliot
  describe KeyParser do
    context "with a string of keys" do
      it "parses them into pairs of keys" do
        subject = KeyParser.new('ID:id Email:email')
        expected_keys = [ ['ID', 'id'],
                          ['Email', 'email'] ]

        parsed_keys = subject.parse
        expect(parsed_keys).to eq(expected_keys)
      end
    end
  end
end
