require 'rails_helper'

RSpec.describe User, type: :model do

  let(:email) { "sandoval@ucb.edu.bo" }
  let(:warden_conditions) { { login: "sandoval@ucb.edu.bo" } }


  it "is invalid with empty attributes" do
    expect(User.new).to_not be_valid
  end

  it "is invalid when an invalid email is registered" do
    new_user = User.create(username: 'test', email: '123123', password: '123123')
    expect(new_user).to_not be_valid
  end

  it "is invalid with empty username" do
    new_user = User.new(username: nil, email: "hoho@gmail.com")
    expect(new_user).to_not be_valid
  end

  it "is valid when the necessary fields are filled" do
   new_user = User.new(username: "TEST", email: "hoho@gmail.com", password: "123123")
   expect(new_user).to be_valid
 end

  it "is invalid when the mail and username are already registered" do
  new_user = User.create(username: "TEST", email: 'sandoval@ucb.edu.bo', password: "123123")
  new_user.login
  repeated_user = User.create(username: "TEST", email: 'sandoval@ucb.edu.bo', password: "123123")
  repeated_user.valid?
  expect(repeated_user.errors.messages[:email]).to eq ['translation missing: es.activerecord.errors.models.user.attributes.email.taken']
  expect(repeated_user).to_not be_valid
  end

  it "is invalid when the mail and username are already registered as an username from another user" do
    new_user = User.create(username: "TEST", email: 'sandoval@ucb.edu.bo', password: "123123")
    new_user.login
    repeated_user = User.create(username: "sandoval@ucb.edu.bo", email: 'real@ucb.edu.bo', password: "123123")
    repeated_user.valid?
    expect(repeated_user).to_not be_valid
    end

  it "has a default role 'estudiante' when created" do
    new_user = User.new()
    new_user.complete_name()
    expect(new_user.role).to eq "estudiante"
  end

  it "finds user by email" do
    user = User.create(username: "sandoval",email: "sandoval@ucb.edu.bo")
    opts = warden_conditions
    authenticated = User.find_for_database_authentication(opts)
    expect(authenticated).to eq nil
  end


  it 'is database authenticable' do
    user = User.create(
       email: 'test@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

end
