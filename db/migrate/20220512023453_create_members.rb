class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :zipcode
      t.integer :phone
      t.boolean :dues_current
      t.timestamps
    end
  end
end
