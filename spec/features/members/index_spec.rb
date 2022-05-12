require 'rails_helper'

describe 'Member Index' do

  it 'displays the attributes of each member record' do

    member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true)
    member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false)
    member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true)
    visit "/members"
    # save_and_open_page
    expect(page).to have_content("first_name: Phil")
    expect(page).to have_content("last_name: Heath")
    expect(page).to have_content("address: 1 barbell lane")
    expect(page).to have_content("zipcode: 80211")
    expect(page).to have_content("phone: 7202123888")
    expect(page).to have_content("dues_current: true")

    expect(page).to have_content("first_name: Nick")
    expect(page).to have_content("last_name: Walker")
    expect(page).to have_content("address: 14 hack squat lane")
    expect(page).to have_content("zipcode: 80212")
    expect(page).to have_content("phone: 3036629399")
    expect(page).to have_content("dues_current: false")

    expect(page).to have_content("first_name: Alina")
    expect(page).to have_content("last_name: Popa")
    expect(page).to have_content("address: 31 barbell lane")
    expect(page).to have_content("zipcode: 80202")
    expect(page).to have_content("phone: 7202222222")
    expect(page).to have_content("dues_current: true")
  end
end
