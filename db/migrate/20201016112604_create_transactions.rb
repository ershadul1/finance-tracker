class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :author_id
      t.string :name
      t.numeric :amount
      t.boolean :earning, default: false
      t.integer :group_id
      t.timestamps
    end
    add_index :transactions, :author_id
    add_index :transactions, :group_id
    add_index :transactions, :amount
    add_index :transactions, :earning
  end
end
