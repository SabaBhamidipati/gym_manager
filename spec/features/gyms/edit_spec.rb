require 'rails_helper'

RSpec.describe 'Edit Gym' do
  describe 'can update gym records' do
    before :each do
      @gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    end

    it 'has a link to update a gym' do
      visit "/gyms/#{@gym1.id}"

      click_link "update gym"
      expect(current_path).to eq("/gyms/#{@gym1.id}/edit")
    end

    it 'can update a gym' do
      visit "/gyms/#{@gym1.id}/edit"
      fill_in :name, with: 'Mountain Mecca'
      fill_in :member_cost, with: 60

      click_on 'Update Gym'
      expect(current_path).to eq("/gyms/#{@gym1.id}")

      expect(page).to have_content('Name: Mountain Mecca')
      expect(page).to have_content('member cost: 60')

      expect(page).to_not have_content('Name: Armbrust')
      expect(page).to_not have_content('Member Cost: 30')
    end
  end
end
