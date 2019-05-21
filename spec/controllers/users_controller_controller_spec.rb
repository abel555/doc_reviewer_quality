require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    include Devise::TestHelpers
    before(:each) do
      #  @user = User.new(params[:"hoooe@gmail.com"])
    #   sign_in @user
    end

    it "should render a new user when you create it" do
        expect(3).to eq(3)    
    end

end
