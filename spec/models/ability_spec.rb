require 'rails_helper'

RSpec.describe Ability, type: :model do

  # it "user can only manage reviews which they own" do
  #   user = User.create(name: 'Juan Pablo', lastname: 'Sandóval Alcocer', role: 'docente', email: 'sandoval@ucb.edu.bo', password: '.sandoval.', username: 'sandoval', admin_role: true)
  #   ability = Ability.new(user)
  #   #owner = User.create(username: 'test', email: 'test@test.com')
  #   ability.should be_able_to(:manage, Paper.new)
  # end

end
