# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Default admin
User.destroy_all
User.create(email: "admin@homelesstaiwan.org", password: "adminadmin", role: "admin")
puts "Default admin created!"

# Survey
Survey.destroy_all
Survey.create( name: "結局結算表單", number_of_players: 11 )

# Endgrade
Endgrade.destroy_all

character_list = [
  { name: "阿和" },
  { name: "阿俊" },
  { name: "小胖" },
  { name: "阿枝" },
  { name: "賈西亞" },
  { name: "小花花" },
  { name: "林秀妹" },
  { name: "陳俊福" },
  { name: "張明雄" },
  { name: "阿孝" },
  { name: "小家" },
]

job_list = [
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "homeless" },
  { job: "social_worker" },
  { job: "social_worker" },
]

ending_list = [
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 22 },
  { ending_number: 23 },
  { ending_number: 23 },
]

mission_1_list = [
  { m1_on_off: "on", m1_is_done: false, m1_intro: "解除酒醉" },
  { m1_on_off: "off" },
  { m1_on_off: "off" },
  { m1_on_off: "off", m1_is_done: false, m1_intro: "看小孩" },
  { m1_on_off: "off" },
  { m1_on_off: "off", m1_is_done: false, m1_intro: "參加小孩婚禮" },
  { m1_on_off: "on", m1_is_done: false, m1_intro: "交到朋友" },
  { m1_on_off: "off", m1_is_done: false, m1_intro: "林秀妹奶奶安養" },
  { m1_on_off: "on", m1_is_done: false, m1_intro: "申請低收入戶" },
  { m1_on_off: "off" },
  { m1_on_off: "off" },
]

mission_2_list = [
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "on", m2_is_done: false, m2_intro: "申請到安養" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
  { m2_on_off: "off" },
]


character_list = [
  { name: "阿和" },
  { name: "阿俊" },
  { name: "小胖" },
  { name: "阿枝" },
  { name: "賈西亞" },
  { name: "小花花" },
  { name: "林秀妹" },
  { name: "陳俊福" },
  { name: "張明雄" },
  { name: "阿孝" },
  { name: "小家" },
]

players_mode_list = [
  [8, 9, 10, 11],
  [10, 11],
  [10, 11],
  [8, 9, 10, 11],
  [8, 9, 10, 11],
  [9, 11],
  [8, 9, 10, 11],
  [8, 9, 10, 11],
  [8, 9, 10, 11],
  [8, 9, 10, 11],
  [8, 9, 10, 11],
]


for i in 0...character_list.count do
  Endgrade.create( name: character_list[i][:name], 
                   job: job_list[i][:job], 
                   survey_id: Survey.first.id, 
                   ending_number: ending_list[i][:ending_number], 
                   mission_1: mission_1_list[i],
                   mission_2: mission_2_list[i],
                   asset: 0, 
                   players_mode: players_mode_list[i])
end

puts "Endgrades have been created!"
