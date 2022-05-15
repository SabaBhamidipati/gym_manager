class AddGymstoMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :gym, foreign_key: true 
  end
end
