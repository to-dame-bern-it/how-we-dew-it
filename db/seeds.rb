# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.destroy_all
Status.destroy_all
Task.destroy_all

["Personal", "Work", "Family"].each do |c|
  Category.create!(
    name: c,
    #user_id:
  )
end

["Todo", "Doing", "Done", "One Day"].each do |s|
  Status.create!(
    name: s,
    color: Faker::Commerce.color
  )
end

bernie = User.create!(name: "Bernie Mac", email: "bernie@caddy.com", password: "bernie")
jackie = User.create!(name: "Jackie Chan", email: "jackie@stuntman.com", password: "jackie")

categories = Category.all
statuses = Status.all
users = User.all
100.times do
  Task.create!(
    #owner_task_id: ,
    user_id: users.sample.id,
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    due_at: Faker::Time.between(DateTime.now - 10, DateTime.now),
    position: rand(1..10.0),
    category_id: categories.sample.id,
    status_id: statuses.sample.id
  )
end
