class CreateBeans < ActiveRecord::Migration[7.0]
  def change
    create_table :beans do |t|
      t.string :name , null: false
      t.string :producingArea
      t.string :kind
      t.integer :degreeOfRoasting
      t.integer :price
      t.integer :acidity
      t.integer :bitter
      t.integer :sweety
      t.integer :fullBody
      t.integer :aroma
      t.text :comments

      t.timestamps
    end
  end
end
