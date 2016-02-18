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



bernie = User.create!(name: "Bernie Mac", email: "bernie@caddy.com", password: "bernie")
jackie = User.create!(name: "Jackie Chan", email: "jackie@stuntman.com", password: "jackie")

User.all.each do |u|
  ["Personal", "Work", "Family"].each do |c|
    Category.create!(
      name: c,
      color: "#{rand(120..255)},#{rand(120..255)},#{rand(120..255)}",
      user_id: u.id
    )
  end

  ["Todo", "Doing", "Done", "One Day"].each do |s|
    Status.create!(
      name: s,
      color: "#{rand(120..255)},#{rand(120..255)},#{rand(120..255)}",
      user_id: u.id
    )
  end

  categories = u.categories
  statuses = u.statuses
  50.times do
    Task.create!(
      #owner_task_id: ,
      user_id: u.id,
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      due_at: Faker::Time.between(DateTime.now - 10, DateTime.now),
      position: rand(1..10.0),
      category_id: categories.sample.id,
      status_id: statuses.sample.id
    )
  end
end

