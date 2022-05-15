class Gym < ApplicationRecord
  has_many :members

  def self.order_by_created_at
    order("created_at desc")
  end
end
