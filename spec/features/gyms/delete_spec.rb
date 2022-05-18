require 'rails_helper'

RSpec.describe 'Gym Deletion' do
  before :each do
    @gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)

    @member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
    @member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: @gym2.id)
    @member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: @gym2.id)
    @member4 = Member.create!(first_name: "Chris", last_name: "Bumstead", address: "55 legpress lane", zipcode: 80222, phone: 7202224122, dues_current: true, gym_id: @gym1.id)
    @member5 = Member.create!(first_name: "Ivana", last_name: "Ivusic", address: "81 cambered bar lane", zipcode: 80211, phone: 3032222248, dues_current: false, gym_id: @gym1.id)
  end

  describe 'destroying a gym' do

    it 'can delete a gym from the index page ' do
      visit "/gyms/#{@gym2.id}"
      expect(page).to have_content("Armbrust2")

      click_button "Delete Gym"

      expect(current_path).to eq("/gyms")
      expect(page).to_not have_content("Armbrust2")
    end

    it 'adds a button to delete each parent' do
       visit "/gyms"
       expect(page).to have_link("Delete #{@gym1.name}")
       expect(page).to have_link("Delete #{@gym2.name}")

       click_link "Delete #{@gym1.name}"
       expect(current_path).to eq("/gyms")
     end
  end
end
