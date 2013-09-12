require 'csv'

class User
  def initialize(attrs = {})
    @id = attrs[:id]
    @email = attrs[:email]
    @first_name = attrs[:first_name]
    @last_name = attrs[:last_name]
  end

  attr_accessor :email, :first_name, :id, :last_name
end

module Eliot
  def self.csv

  end
end


et = Eliot.csv
          .extract(:id, :email, :_, :first_name, :last_name, :*)
          .into { |data| User.new(data.to_hash) }
