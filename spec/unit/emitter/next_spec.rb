require 'spec_helper'

describe Emitter, "#next" do
  subject { Emitter.new }

  context "with a single source" do
    before { subject.load(source) }
  end

  context "with multiple sources"
end
