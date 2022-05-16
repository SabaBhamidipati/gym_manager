# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Gym.destroy_all
Member.destroy_all

gym1 = Gym.create!(name: "Armbrust", zip_code: 80204, member_cost: 45, member_initiation_fee: 30, guest_cost: 20, open: true)
gym2 = Gym.create!(name: "Armbrust2", zip_code: 80201, member_cost: 55, member_initiation_fee: 30, guest_cost: 20, open: true)
gym3 = Gym.create!(name: "Armbrust3", zip_code: 80200, member_cost: 65, member_initiation_fee: 30, guest_cost: 20, open: true)

member1 = Member.create!(first_name: "Phil", last_name: "Heath", address: "1 barbell lane", zipcode: 80211, phone: 7202123888, dues_current: true, gym_id: gym2.id)
member2 = Member.create!(first_name: "Nick", last_name: "Walker", address: "14 hack squat lane", zipcode: 80212, phone: 3036629399, dues_current: false, gym_id: gym2.id)
member3 = Member.create!(first_name: "Alina", last_name: "Popa", address: "31 barbell lane", zipcode: 80202, phone: 7202222222, dues_current: true, gym_id: gym2.id)
member4 = Member.create!(first_name: "Chris", last_name: "Bumstead", address: "55 legpress lane", zipcode: 80222, phone: 7202224122, dues_current: true, gym_id: gym1.id)
member5 = Member.create!(first_name: "Ivana", last_name: "Ivusic", address: "81 cambered bar lane", zipcode: 80211, phone: 3032222248, dues_current: false, gym_id: gym1.id)
member6 = Member.create!(first_name: "Brett", last_name: "Wilkin", address: "44 legpress lane", zipcode: 80235, phone: 3032222222, dues_current: true, gym_id: gym3.id)
member7 = Member.create!(first_name: "Ronnie", last_name: "Coleman", address: "121 cambered bar lane", zipcode: 80241, phone: 3032224122, dues_current: false, gym_id: gym3.id)
member8 = Member.create!(first_name: "Blessing", last_name: "Awodibe", address: "73 hack squat lane", zipcode: 80177, phone: 7206629341, dues_current: false, gym_id: gym3.id)
