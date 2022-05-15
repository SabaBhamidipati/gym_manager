class Gym < ApplicationRecord
  has_many :members

  def self.order_by_created_at
    order("created_at desc")
  end

  def total_members_associated_with_gym
    members.count
    #class methods only whne you're comparing more than 1 gym 
  end
end
