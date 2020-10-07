# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times do
#   Board.create(
#       user_id: 1,
#       name: Faker::Lorem.sentence(word_count: 3),
#       description: Faker::Lorem.sentence(word_count: 10)
#   )
# end

3.times do
  Task.create(
    user_id: 1,
    board_id: 7,
    name: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.sentence(word_count: 50)
  )
end
