require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Validates group name' do
    it 'Should be valid' do
      @group = Group.new(name: 'Essential')
      expect(@group.save).to be true
    end

    it 'should not be valid' do
      @group = Group.new(name: '')
      expect(@group.save).not_to be true
    end
  end

  context 'associations between transaction and group model' do
    it 'a group can have many transactions' do
      @user1 = User.create(name: 'Rayhan', email: 'rayhan@something.com',
                           password: '123456', password_confirmation: '123456')
      t = Transaction.new(name: 'pay rent', amount: 100)
      @user1.transactions << t
      g = Group.new(name: 'house')
      t.transaction_grouper << g
      t2 = Transaction.new(name: 'pay bill', amount: 20)
      @user1.transactions << t2
      t2.transaction_grouper << g
      expect(g.grouped_transactions.count).to eql(2)
    end
  end
end
