require 'spec_helper'
require 'stringio'
require 'pathname'

describe Emitter, "#load" do
  subject { Emitter.new }
  before { subject.load(source) }

  context "with a File" do
    let(:source) { File.new('tmp') }
    it "adds it to the source list" do
      expect(subject.sources.first).to be_a File
    end
  end

  context "with a Pathname" do
    let(:source) { Pathname.new(__FILE__) }
    it "resolves the Pathname to a File" do
      expect(subject.sources.first).to be_a File
    end
  end

  context "a path to a readable file" do
    let(:source) { __FILE__ }
    it "resolves the source to a file" do
      expect(subject.sources.first).to be_a File
    end
  end

  context "with a StringIO" do
    let(:source) { StringIO.new("foo\nbar\nqux") }
    it "adds it to the source list" do
      expect(subject.sources.first).to be_a StringIO
    end
  end

  context "with a String" do
    let(:source) { "foo bar qux" }
    it "converts it into a StringIO" do
      expect(subject.sources.first).to be_a StringIO
    end
  end

  it "can be called multiple times"
  it "can be called with multiple sources"

end
