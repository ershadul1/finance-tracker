require 'rails_helper'

RSpec.describe 'Creating a transaction process', type: :feature do
  before :each do
    @user1 = User.create(name: 'User1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
  end

  it 'Creates a new transaction' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    click_on 'NEW TRANSACTION'
    fill_in 'transaction[name]', with: 'Receive Salary'
    fill_in 'transaction[amount]', with: '500'

    click_button 'Create Transaction'

    expect(page).to have_content('Receive Salary')
  end
end
