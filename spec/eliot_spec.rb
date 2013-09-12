require 'spec_helper'
require 'eliot'

describe Eliot do
  before :all do
    @users_csv = <<-CSV
ID, E-mail, Status, First Name, Last Name, Last Login
1,  alice@example.com, active, Alice, Smith,2013-06-01
2,  bob@example.com, active, Bob, Smith,2013-04-26
2,  charlie@example.com, inactive, Charlie, Smith,2013-04-26
    CSV
  end

  let(:parser) {
    Eliot.csv
         .extract(:id, :email, :_, :first_name, :last_name, :*)
         .on_key(:id, &:to_i)
         .on_key(:email) { |v| v.strip }
         .into { |data| User.new(data.to_hash) }
  }

  subject { parser.parse(@users_csv) }

  it "builds a list of objects from CSV" do
    subject.should have(3).users
  end

  it "builds the right object" do
    alice = subject.first
    alice.id.should == 1
    alice.email.should == 'alice@example.com'
  end
end
