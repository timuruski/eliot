require 'spec_helper'
require 'support/user'
require 'eliot/csv'

describe Eliot, ".csv" do
  before :all do
    users_path = File.expand_path('support/users.csv', SPEC_DIR)
    @users_csv = File.read(users_path)
  end

  let(:parser) {
    Eliot.csv('a:id b:email d:first_name, c:last_name')
         .on(:id, &:to_i)
         .on(:email) { |v| v.strip }
         .load(@users_csv)
  }

  subject { parser.map { |attrs| User.new(attrs.to_h) } }

  it "builds a list of objects from CSV" do
    subject.should have(3).users
  end

  it "builds the right object" do
    alice = subject.first
    alice.id.should == 1
    alice.email.should == 'alice@example.com'
  end
end
