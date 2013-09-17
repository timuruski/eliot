require 'spec_helper'
require 'eliot/attribute_set'

module Eliot
  describe AttributeSet do
    before :all do
      @data = { name: 'alice',
                email: 'alice@example.com' }
    end

    subject { AttributeSet.new(@data) }

    it "can convert to a hash" do
      hash = subject.to_h
      # expect { hash }.to == @data
      expect(hash).to eq(@data)
    end

    it "can convert to a proc" do
      user = double('user')
      user.should_receive(:name=).with('alice')
      user.should_receive(:email=).with('alice@example.com')

      subject.to_proc.call(user)
    end

    it "can be assigned a value" do
      subject[:user_id] = 42
      expect(subject[:user_id]).to eq(42)
    end
  end
end
