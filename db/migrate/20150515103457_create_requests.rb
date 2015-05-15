class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :description
      t.string :category
      t.string :email
      t.integer :price
      t.datetime :deadline
      t.boolean :read
      t.timestamps null: false
    end
  end
end
