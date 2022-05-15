class Gym < ApplicationRecord
  has_many :members

  def self.order_by_created_at
    order("created_at desc")
  end

  def self.total_members_associated_with_gym
    members.count
  end
end
