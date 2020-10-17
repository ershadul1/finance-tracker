class CreateGroupsTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_transactions do |t|
      t.integer :grouped_transaction_id
      t.integer :transaction_grouper_id
      t.timestamps
    end
    add_index :groups_transactions, :grouped_transaction_id
    add_index :groups_transactions, :transaction_grouper_id
  end
end
