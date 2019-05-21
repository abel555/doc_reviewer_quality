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
  repeated_user = User.create(username: "TEST", email: 'sandoval@ucb.edu.bo', password: "123123")
  repeated_user.valid?
  expect(repeated_user.errors.messages[:email]).to eq ['translation missing: es.activerecord.errors.models.user.attributes.email.taken']
  expect(repeated_user).to_not be_valid
  end

  it "has a default role 'estudiante' when created" do
    new_user = User.new()
    expect(new_user.role).to eq "estudiante"
  end

  it "finds user by email" do
    user = User.create(username: "sandoval",email: "sandoval@ucb.edu.bo")
    opts = warden_conditions
    authenticated = User.find_for_database_authentication(opts)
    expect(authenticated).to eq nil
  end

  it "has one after adding one" do
    instance_double("User", :username => "Harold")
  end


  # Failure/Error: expect(User.new).to be_valid
  # expected #<User id: nil, email: "", created_at: nil, updated_at: nil, name: nil, 
  # lastname: nil, ci: nil, phone: nil, career: nil, role: "estudiante", username: nil, admin_role: 
  # false, tutor_role: nil, relator_role: nil, professor_role: nil, professional_degree: nil> 
  # to be valid, but got errors: Email translation missing: es.activerecord.errors.models.user.attributes.email.invalid, 
  # Email translation missing: es.activerecord.errors.models.user.attributes.email.blank, 
  # Contraseña translation missing: es.activerecord.errors.models.user.attributes.password.blank


end
