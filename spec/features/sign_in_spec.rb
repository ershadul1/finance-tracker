require 'rails_helper'

RSpec.describe 'Sign in process', type: :feature do
  before :each do
    @user1 = User.create!(name: 'User1', email: 'user1@something.com',
                          password: '123456', password_confirmation: '123456')
  end

  it 'Signs in a registered user' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)
  end
end
