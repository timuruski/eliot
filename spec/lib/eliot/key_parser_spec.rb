require 'spec_helper'
require 'eliot/key_parser'

module Eliot
  describe KeyParser do
    context "with an array of paired values" do
      it "parses them into pairs of keys" do
        subject = KeyParser.new(%w[ID:id Email:email])

        expected_keys = [ ['ID', 'id'],
                          ['Email', 'email'] ]

        parsed_keys = subject.parse
        expect(parsed_keys).to eq(expected_keys)
      end

      it "parses single keys into a pair" do
        subject = KeyParser.new(%w[id email])

        expected_keys = [ ['id', 'id'],
                          ['email', 'email'] ]

        parsed_keys = subject.parse
        expect(parsed_keys).to eq(expected_keys)
      end

      it "parses incomplete keys into a pair" do
        subject = KeyParser.new(%w[id: email:])

        expected_keys = [ ['id', 'id'],
                          ['email', 'email'] ]

        parsed_keys = subject.parse
        expect(parsed_keys).to eq(expected_keys)
      end

      it "can use an arbitrary separator" do
        subject = KeyParser.new(%w[user:id=id user:email=email],
                                separator: '=')

        expected_keys = [ ['user:id', 'id'],
                          ['user:email', 'email'] ]

        parsed_keys = subject.parse
        expect(parsed_keys).to eq(expected_keys)
      end
    end
  end
end
