require 'rails_helper'

describe 'Member Show' do
  before :each do
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
  end

  it 'displays the attributes of each member record' do
    visit "/members/#{@member1.id}"
    # save_and_open_page
    expect(page).to have_content("first_name: Phil")
    expect(page).to have_content("last_name: Heath")
    expect(page).to have_content("address: 1 barbell lane")
    expect(page).to have_content("zipcode: 80211")
    expect(page).to have_content("phone: 7202123888")
    expect(page).to have_content("dues_current: true")
  end

  it 'displays the members index link' do
    visit "/members/#{@member1.id}"
    click_link "members index page"
    expect(current_path).to eq("/members")
  end

  it 'displays the gyms index link' do
    visit "/members/#{@member1.id}"
    click_link "gyms index page"
    expect(current_path).to eq("/gyms")
  end
end
