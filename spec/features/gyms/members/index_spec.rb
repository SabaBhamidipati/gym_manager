  require 'rails_helper'

RSpec.describe 'Member Index' do

  before :each do
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member1 = @gym2.members.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: @gym2.id)
    @member2 = @gym2.members.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: @gym2.id)
    @member3 = @gym2.members.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: @gym2.id)
    @member8 = @gym3.members.create!(first_name: "Blessing", last_name: "Awodibe", address: "73 hack squat lane", zipcode: 80177, phone: 7206629341, dues_current: false, gym_id: @gym3.id)
  end

  it 'shows all of the members associated with a gym and their attributes' do

    visit "/gyms/#{@gym2.id}/members"
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

    expect(page).to_not have_content("first_name: Blessing")
    expect(page).to_not have_content("last_name: Awodibe")
  end

  it 'displays the members index link' do
    visit "/gyms/#{@gym2.id}/members"
    click_link "members index page"
    expect(current_path).to eq("/members")
  end

  it 'displays the gyms index link' do
    visit "/gyms/#{@gym2.id}/members"
    click_link "gyms index page"
    expect(current_path).to eq("/gyms")
  end

  describe 'new adoptable member creation' do
    it 'links to a new page from the gym index' do
      visit "/gyms/#{@gym2.id}/members"

      click_link('New Member')
      expect(current_path).to eq("/gyms/#{@gym2.id}/members/new")
    end

    it 'creates a new member' do
      visit "/gyms/#{@gym2.id}/members/new"
      fill_in 'first_name', with: 'Jay'
      fill_in 'last_name', with: 'Cutler'
      fill_in 'address', with: '2233 Farnsworth Rd'
      fill_in 'zipcode', with: '87634'
      fill_in 'phone', with: '3035574848'
      fill_in 'dues_current', with: 'true'
      click_on 'Create Member'

      expect(current_path).to eq("/gyms/#{@gym2.id}/members")
      expect(page).to have_content('Jay')
      expect(page).to have_content('Cutler')
      expect(page).to have_content('2233 Farnsworth Rd')
      expect(page).to have_content('87634')
      expect(page).to have_content('3035574848')
      expect(page).to have_content('true')
    end

    it 'sorts members alphabetically' do
      visit "/gyms/#{@gym2.id}/members"
      click_link 'Sort Members'
      expect(current_path).to eq("/gyms/#{@gym2.id}/members")
      # save_and_open_page
      expect(@member3.first_name).to appear_before(@member2.first_name)
      expect(@member2.first_name).to appear_before(@member1.first_name)
    end

    describe 'edit Members' do
      it 'has links to edit each member for each gym' do
        visit "/gyms/#{@gym2.id}/members"
      expect(page).to have_link("Edit #{@member1.first_name}")
      expect(page).to have_link("Edit #{@member2.first_name}")
      expect(page).to have_link("Edit #{@member3.first_name}")

      click_link "Edit #{@member1.first_name}"
      expect(current_path).to eq("/members/#{@member1.id}/edit")
      end

      it 'has links to edit each member for each gym' do
        visit "/gyms/#{@gym3.id}/members"
        expect(page).to have_link("Edit #{@member8.first_name}")

      click_link "Edit #{@member8.first_name}"
      expect(current_path).to eq("/members/#{@member8.id}/edit")
      end
    end
  end

end
