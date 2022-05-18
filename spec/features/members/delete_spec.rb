require 'rails_helper'

RSpec.describe 'Member Deletion' do

  before :each do
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
    @member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: @gym2.id)
    @member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: @gym2.id)
    @member8 = Member.create!(first_name: "Blessing", last_name: "Awodibe", address: "73 hack squat lane", zipcode: 80177, phone: 7206629341, dues_current: false, gym_id: @gym3.id)
  end

  describe 'destroy child record' do
    it 'can delete a child record' do
      visit "/members/#{@member1.id}"
      expect(page).to have_content("Phil")

      click_button "Delete Member"

      expect(current_path).to eq("/members")
      expect(page).to_not have_content("Phil")
    end
  end
end
