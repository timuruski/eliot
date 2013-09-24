require 'spec_helper'

describe KeySet, "#each" do
  subject { KeySet.new(%w[foo:bar]) }

  it "emits each key pair parsed" do
    pairs = []
    subject.each do |raw,key|
      pairs << [raw, key]
    end

    expect(pairs).to eq([['foo', 'bar']])

    # Hmm, no works.
    # expect { |b| subject.each.tap(&b) }
    #   .to yield_successive_args(['foo', 'bar'])
  end
end
