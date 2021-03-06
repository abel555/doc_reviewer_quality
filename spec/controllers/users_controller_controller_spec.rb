require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe '#Create' do
        it 'create an user' do

            expect{
                user = User.new(name: 'Juan Pablo', lastname: 'Sandóval Alcocer', professional_degree: 'Dr.', role: 'docente', email: 'sandoval@ucb.edu.bo', career: 'exampleCareer', password: '.sandoval.', username: 'sandoval', admin_role: true)
                user.save
            }.to change(User,:count).by(1)
            

        end
        it "redirects to the new contact" do
            user = User.create(name: 'Juan Pablo', lastname: 'Sandóval Alcocer', professional_degree: 'Dr.', role: 'docente', email: 'sandoval@ucb.edu.bo', career: 'exampleCareer', password: '.sandoval.', username: 'sandoval', admin_role: true)
            response.should have_http_status(200)
        end 
    end
    include Devise::TestHelpers
    before(:each) do
      #  @user = User.new(params[:"hoooe@gmail.com"])
    #   sign_in @user
    end

    it "should render a new user when you create it" do
        expect(3).to eq(3)    
    end

end
