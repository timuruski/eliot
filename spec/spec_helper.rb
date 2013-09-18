# class User
#   def initialize(attrs = {})
#     @id = attrs[:id]
#     @email = attrs[:email]
#     @first_name = attrs[:first_name]
#     @last_name = attrs[:last_name]
#   end

#   attr_accessor :email, :first_name, :id, :last_name
# end

RSpec.configure do |config|
  config.color = true
  config.order = 'rand'
end
