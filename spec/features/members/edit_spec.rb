require 'rails_helper'

RSpec.describe 'Edit Member' do
  it 'has a link to update a member' do
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)

    visit "/members/#{@member1.id}"
    save_and_open_page
    click_link "Update Member"
    expect(current_path).to eq("/members/#{@member1.id}/edit")
  end

  # it ''

end
