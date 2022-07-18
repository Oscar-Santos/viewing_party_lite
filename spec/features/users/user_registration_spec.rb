# As a visitor
# When I visit `/register`
# I see a form to fill in my name, email, password, and password confirmation.
# When I fill in that form with my name, email, and matching passwords,
# I'm taken to my dashboard page `/users/:id`

require 'rails_helper'

RSpec.describe 'User Registration Page' do
  it 'can register a user' do

    visit '/register'

    name = 'Pablo'
    email = "pablo@gmail.com"
    password = "test"

    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Register User"
    user = User.create(name: 'john', email: 'john@gmail.com', password: 'test123', password_confirmation: 'test123')
    expect(current_path).to eq(user_path(user.id))

    expect(page).to have_content("Welcome, #{email}!")
  end
end
