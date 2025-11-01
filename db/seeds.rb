# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Tag.create([
  { name:'メーカー'},
  { name:'商社'},
  { name:'コンサル'},
  { name:'金融'},
  { name:'IT・通信'},
  { name:'広告・マスコミ'},
  { name:'人材・教育'},
  { name:'インフラ・交通'},
  { name:'不動産・建設'},
  { name:'旅行・観光'},
  { name:'医療・福祉'},
  { name:'小売・流通'},
  { name:'公務員・官公庁'},
  { name:'その他'}
])