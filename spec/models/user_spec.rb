require 'rails_helper'

RSpec.describe User, type: :model do

  it "Has an email and a username" do
    expect(User.count).to eq 0
  end

  it "has one after adding one" do
    instance_double("User", :username => "Harold")
  end

end
