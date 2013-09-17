require 'spec_helper'
require 'eliot/emitter'

module Eliot
  describe Emitter do
    it "should exist" do
      subject.should be_an Emitter
    end

    before :all do
      @names = "alice\nbob"
      @fruit = "apple\nbanana"
    end

    it "can load strings" do
      subject.load @names
      subject.load @fruit
      subject.sources.should == [@names, @fruit]
    end

    it "can iterate over items across sources" do
      subject.load @names
      subject.load @fruit

      output = []
      subject.each do |item|
        output << item.chomp
      end

      output.should == %w[alice bob apple banana]
    end
  end
end
