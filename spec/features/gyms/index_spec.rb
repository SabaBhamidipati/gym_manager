require 'rails_helper'

describe 'Gym Index' do
  before :each do
    @gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
    @gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)
    @member8 = Member.create!(first_name: "Blessing", last_name: "Awodibe", address: "73 hack squat lane", zipcode: 80177, phone: 7206629341, dues_current: false, gym_id: @gym3.id)
  end

  it 'displays the name of each gym record' do
    visit "/gyms"
    # save_and_open_page
    expect(page).to have_content("Armbrust")
    expect(page).to have_content("Armbrust2")
    expect(page).to have_content("Armbrust3")

    expect(page).to_not have_content("Blessing Awodibe")
  end

   it 'displays the most recently created records first' do
    visit "/gyms"
    # save_and_open_page
    expect("#{@gym2.name}").to_not appear_before("#{@gym1.name}")
    expect("#{@gym1.name}").to appear_before("#{@gym2.name}")
   end

   it 'displays the members index link' do
     visit "/gyms"

     click_link "members index page"
     expect(current_path).to eq("/members")
   end

   it 'displays the gyms index link' do
     visit "/gyms"
     click_link "gyms index page"
     expect(current_path).to eq("/gyms")
   end

   describe 'new Gym creation' do
     it 'links to a new page from the gyms index' do
       visit '/gyms'

       click_link('New Gym')
       expect(current_path).to eq('/gyms/new')
        # save_and_open_page

       fill_in 'Name', with: 'Mountain Mecca'
       click_on 'Create Gym'

       expect(current_path).to eq('/gyms')
       expect(page).to have_content('Mountain Mecca')
     end
   end
end
