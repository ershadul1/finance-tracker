require 'rails_helper'

RSpec.describe 'Creating a group process', type: :feature do
  before :each do
    @user1 = User.create(name: 'User1', email: 'user1@something.com',
                         password: '123456', password_confirmation: '123456')
  end

  it 'Creates a new group' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_button 'Log in'
    expect(current_path).to eql(root_path)

    click_on 'Groups'
    click_on 'NEW GROUP'
    fill_in 'group[name]', with: 'FOOD'
    attach_file('group_picture', 'spec/files/images/ungrouped.png')
    click_button 'Create Group'
    sleep(3)
    expect(page).to have_content('FOOD')
  end
end
