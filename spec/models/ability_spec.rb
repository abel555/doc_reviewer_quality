require 'rails_helper'
require "cancan/matchers"


RSpec.describe Ability, type: :model do

  it "admin can manage I'ts corresponding responsabilities" do
    user = User.create(name: 'Juan Pablo', lastname: 'Sandóval Alcocer', role: 'docente', email: 'sandoval@ucb.edu.bo', password: '.sandoval.', username: 'sandoval', admin_role: true)
    ability = Ability.new(user)
    ability.should be_able_to(:manage, Event.new)
    ability.should be_able_to(:manage, Paper.new)
    ability.should be_able_to(:manage, Survey.new)
    ability.should be_able_to(:manage, Assingment.new)
    ability.should be_able_to(:manage, Classroom.new)
  end
end
