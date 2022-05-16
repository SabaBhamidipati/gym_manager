require 'rails_helper'

describe 'Gym Show' do
  before :each do
    @gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)

    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
    @member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: @gym2.id)
    @member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: @gym2.id)
    @member4 = Member.create!(first_name: "Chris", last_name: "Bumstead", address: "55 legpress lane", zipcode: 80222, phone: 7202224122, dues_current: true, gym_id: @gym1.id)
    @member5 = Member.create!(first_name: "Ivana", last_name: "Ivusic", address: "81 cambered bar lane", zipcode: 80211, phone: 3032222248, dues_current: false, gym_id: @gym1.id)
  end

  it 'displays the attributes of each gym record' do
    visit "/gyms/#{@gym1.id}"
    # save_and_open_page
    expect(page).to have_content("Armbrust")
    expect(page).to have_content("zip code: 80204")
    expect(page).to have_content("member cost: 45")
    expect(page).to have_content("member initiation fee: 30")
    expect(page).to have_content("guest cost: 20")
    expect(page).to have_content("open: true")
  end

  it 'shows a count of the number of members associated with a gym' do
    visit "/gyms/#{@gym1.id}"
    expect(page).to have_content("member count: 2")
  end

  it 'displays the members index link' do
    visit "/gyms/#{@gym1.id}"
    click_link "members index page"
    expect(current_path).to eq("/members")
  end

  it 'displays the gyms index link' do
    visit "/gyms/#{@gym1.id}"
    click_link "gyms index page"
    expect(current_path).to eq("/gyms")
  end

  it 'displays the gyms index link' do
    visit "/gyms/#{@gym1.id}"
    click_link "gym1 members index page"
    expect(current_path).to eq("/gyms")
  end
end
