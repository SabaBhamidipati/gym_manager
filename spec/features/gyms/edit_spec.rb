require 'rails_helper'

RSpec.describe 'Edit Gym' do
  it 'can update a gym' do
    @gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)

    visit '/gyms'

    
  end
end
