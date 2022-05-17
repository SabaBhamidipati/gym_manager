require 'rails_helper'

describe 'Member Show' do
  before :each do
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
    @member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: @gym2.id)
    @member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: @gym2.id)
    @member8 = Member.create!(first_name: "Blessing", last_name: "Awodibe", address: "73 hack squat lane", zipcode: 80177, phone: 7206629341, dues_current: false, gym_id: @gym3.id)
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

    expect(page).to_not have_content("first_name: Blessing")
    expect(page).to_not have_content("last_name: Awodibe")
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

  describe 
end
