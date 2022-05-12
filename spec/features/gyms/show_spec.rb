require 'rails_helper'

describe 'Gym Index' do

  it 'displays the name of each gym record' do

    gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    visit "/gyms/#{gym1.id}"
    # save_and_open_page
    expect(page).to have_content("Armbrust")
    expect(page).to have_content("zip code: 80204")
    expect(page).to have_content("member cost: 45")
    expect(page).to have_content("member initiation fee: 30")
    expect(page).to have_content("guest cost: 20")
    expect(page).to have_content("open: true")
  end
end
