require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'Validates transaction name' do
    it 'Should be valid' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @transaction = @user1.transactions.build(name: 'buy apples', amount: 10)
      expect(@transaction.save).to be true
    end

    it 'should not be valid' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @transaction = @user1.transactions.build(name: '', amount: 10)
      expect(@transaction.save).not_to be true
    end
  end

  context 'Validates transaction amount' do
    it 'Should be valid' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @transaction = @user1.transactions.build(name: 'buy apples', amount: 10)
      expect(@transaction.save).to be true
    end

    it 'amount should be present' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @transaction = @user1.transactions.build(name: 'buy apples')
      expect(@transaction.save).not_to be true
    end

    it 'amount should be less than 1000000000' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      @transaction = @user1.transactions.build(name: 'buy apples', amount: 1_000_000_000)
      expect(@transaction.save).not_to be true
    end
  end

  context 'associations between transaction and group model' do
    it 'a transaction can have many groups' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      t = Transaction.new(name: 'pay rent', amount: 100)
      @user1.transactions << t
      g = Group.new(name: 'house')
      t.transaction_grouper << g
      g2 = Group.new(name: 'important')
      t.transaction_grouper << g2
      expect(t.transaction_grouper.count).to eql(2)
    end
  end
end
