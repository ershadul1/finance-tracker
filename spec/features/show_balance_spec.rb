require 'rails_helper'

RSpec.describe 'Creating a transaction process', type: :feature do
  before :each do
    @user1 = User.create(name: 'User1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
    @transaction1 = Transaction.create(name: 'Salary', author_id: @user1.id, amount: 2000, earning: true)
    @transaction2 = Transaction.create(name: 'Pay rent', author_id: @user1.id, amount: 400)
  end

  it 'Creates a new transaction' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    expect(page).to have_content('1,600')
  end
end
