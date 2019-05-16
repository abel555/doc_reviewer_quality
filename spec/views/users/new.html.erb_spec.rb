require "rails_helper"

describe "users/new" do

#   it "displays a new user" do

#     assign(:users, [
#       stub_model(User, :username => "user01"),
#     ])
#     render
#     rendered.to exist("user01")
#   end

it "displays the given text" do

    render :plain => "Crear usuario"

    expect(rendered).to match /Crear usuario/
  end
end