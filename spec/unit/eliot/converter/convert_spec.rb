require 'spec_helper'

describe Converter, "#convert" do
  subject { Converter.new(keys) }

  let(:keys) { [ ['foo','foo'] ] }

  it "returns an AttributeSet" do
    data = { foo: 'bar' }
    attrs = subject.convert(data)

    expect(attrs.to_h).to eq(data)
  end
end
