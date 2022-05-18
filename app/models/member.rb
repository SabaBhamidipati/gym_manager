class Member < ApplicationRecord
  belongs_to :gym

  def self.dues_current_only
    where(dues_current: true)
    # require "pry"; binding.pry
  end

  def self.sort_alphabetically
     Member.order(:first_name)
    # require "pry"; binding.pry
  end
end
