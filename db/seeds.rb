# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Default admin
User.create(email: "admin@homelesstaiwan.org", password: "adminadmin", role: "admin")
puts "Default admin created!"


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
  { job: "social_worder" },
]

for i in 0...character_list.count do
  Endgrade.create( name: character_list[i][:name], job: job_list[i][:job])
end
# character_list.each do |c|
#   job_list.each do |j|
#     Endgrade.create( name: c[:name], job: j[:job])
#   end
# end
puts "Endgrades have been created!"
