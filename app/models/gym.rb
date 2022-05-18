class Gym < ApplicationRecord
  has_many :members, :dependent => :destroy

  def self.order_by_created_at
    order("created_at desc")
  end

  def total_members_associated_with_gym
    members.count
  end
end
