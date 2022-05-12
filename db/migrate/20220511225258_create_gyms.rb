class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.integer :zip_code
      t.integer :member_cost
      t.integer :member_initiation_fee
      t.integer :guest_cost
      t.boolean :open
      t.timestamps
    end
  end
end
