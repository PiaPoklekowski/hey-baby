# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

pregnancy = Pregnancy.create(
  mother: User.find(2),
  due_date: Date.new,
  baby_nickname: "name",
  pregnancy_week: 3,
  gender: "male"
)

category = Category.find(2)
date = DateTime.new(2022, 2, 3)
puts "#{category.id}"
puts "#{pregnancy.id}"
puts "#{date}"

task = Task.new(
  name: "Book hospital",
  description: "Description for the book hosptial task",
  start_time: date,
  deadline: date,
  category: category,
  pregnancy: pregnancy
)
puts "#{task.name}"
task.save
