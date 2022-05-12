class ChangeIntegerLimitInMembers < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :phone, :integer, limit: 8
  end
end
