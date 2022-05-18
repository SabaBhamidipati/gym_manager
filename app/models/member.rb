class Member < ApplicationRecord
  belongs_to :gym

  def self.dues_current_only
    where(dues_current: true)
  end

  def self.sort_alphabetically
     Member.order(:first_name)
  end

  def self.filter_to(threshold)
    Member.where("zipcode > ?", threshold)
  end
end
