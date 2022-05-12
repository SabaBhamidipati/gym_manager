require 'rails_helper'

describe 'Gym Index' do

  it 'displays the name of each gym record' do

    gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)
    visit "/gyms"
    # save_and_open_page
    expect(page).to have_content("Armbrust")
    expect(page).to have_content("Armbrust2")
    expect(page).to have_content("Armbrust3")
  end
end
