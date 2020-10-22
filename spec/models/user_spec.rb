require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validates user\'s name' do
    it 'Should be valid' do
      @user1 = User.new(name: 'Rayhan', email: 'rayhan@something.com',
                        password: '123456', password_confirmation: '123456')

      expect(@user1.save).to be true
    end

    it 'should not be valid' do
      @user1 = User.new(name: '', email: 'rayhan@something.com',
                        password: '123456', password_confirmation: '123456')

      expect(@user1.save).not_to be true
    end
  end

  context "Validates user email's uniqueness" do
    it 'Should be valid' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @user2 = User.new(name: 'Ray', email: 'ray@something.com',
                        password: '123456', password_confirmation: '123456')
      expect(@user2.save).to be true
    end

    it 'Should be invalid' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @user2 = User.new(name: 'Ray', email: 'rayhan@something.com',
                        password: '123456', password_confirmation: '123456')
      expect(@user2.save).not_to be true
    end
  end

  context 'associations between user and transaction model' do
    it 'user can create many transactions' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      t = Transaction.new(name: 'pay rent', amount: 100)
      @user1.transactions << t
      t2 = Transaction.new(name: 'pay bill', amount: 20)
      @user1.transactions << t2
      expect(@user1.transactions.count).to eql(2)
    end
  end
end
