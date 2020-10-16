class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.timestamps
    end
    add_index :groups, :name
    add_index :groups, :icon
  end
end
