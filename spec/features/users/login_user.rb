require 'rails_helper'

RSpec.describe 'login page' do
  it 'User can login' do
    user_1 = User.create!(name: 'Juan', email: 'jaun@gmail.com', password: 'test3', password_confirmation: 'test3')

    visit '/login'

    fill_in 'Email', with: "#{user_1.email}"
    fill_in 'Password', with: "#{user_1.password}"
    click_button('Log In')

    expect(current_path).to eq(user_path(user_1.id))
  end

  it 'filling in bad information' do
    user = User.create!(name: 'George', email: 'george@gmail.com', password: 'test4', password_confirmation: 'test4')

    visit "/login"

    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "que"
    click_button('Log In')

    expect(current_path).to eq('/login')
    expect(page).to have_content("Invalid Credentials")
  end
end
