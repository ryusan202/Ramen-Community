# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'admin@admin',
   password: '846557'
)

# User.create!(
#   email: 'test@test',
#   password: '846557'
# )
%i[
とんこつラーメン
しょうゆラーメン
みそラーメン
しおラーメン
とんこつしょうゆラーメン
とんこつみそラーメン
とんこつしおラーメン
とんこつとんこつラーメン
しょうゆみそラーメン
しょうゆしおラーメン
みそしおラーメン
つけ麺
担々麺
五目ラーメン
カレーラーメン
タンメン
ワンタンメン
チャーシューメン
ネギラーメン
ベジタリアンラーメン
].each { |name| Genre.find_or_create_by(name:) }
genre_ids = Genre.all.pluck(:id)



post_attributes.each do |post_attribute|
  Post.find_or_create_by(
    title: post_attribute[:title],
    user_id: post_attribute[:user_id],
    genre_id: genre_ids.sample
  )
end