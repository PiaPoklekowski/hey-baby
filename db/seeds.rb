# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Create Heybaby database"
Category.destroy_all
Task.destroy_all
Pregnancy.destroy_all
User.destroy_all

CATEGORIES = ["Birth certificate",
  "Child benefit",
  "Hospital"]

user_one = User.create!(
    email: "heybabyberlin@gmail.com",
    password: "123456"
  )

  p user_one

  pregancy_one = Pregnancy.create!(
    due_date: Date.new(2022, 12, 15),
    baby_nickname: "Tupac",
    pregnancy_week: 11,
    gender: "boy",
    mother: user_one
  )

p pregancy_one
CATEGORIES.each do |category|
  Category.create!(
    name: category,
    description: category
  )
end

hospital_category = Category.find_by(name: "Hospital")
child_benefit_category = Category.find_by(name: "Child benefit")
birth_certificate_category = Category.find_by(name: "Birth certificate")

Task.create!(
  name: "Find an hospital",
  description: "If you wish to give birth at a birthing centre or elsewhere with a midwife in attendance, early application is needed.
  You can register later at a hospital. This registration is not binding.",
  start_time: 20,
  deadline: 22,
  category: hospital_category,
  pregnancy: pregancy_one
)

Task.create!(
  name: "Book an appointment",
  description: "Book an appointment for the registration at the hospital of your choice",
  start_time: 22,
  deadline: 25,
  category: hospital_category,
  pregnancy: pregancy_one
)

Task.create!(
  name: "Visit and register in you Hospital",
  description: "Onsite interview with a Midwife. Explain your birth type wishes and questions (waterbirth, natural birth..., room wishes)",
  start_time: 22,
  deadline: 25,
  category: hospital_category,
  pregnancy: pregancy_one
)

Task.create!(
  name: "Applying for child benefit (Kindergeld)",
  description: "As soon as the birth certificate is available - Create! an account and fill in the form, print, sign and scan and send it to the given address",
  start_time: 44,
  form_url_de: "https://web.arbeitsagentur.de/opal/kgo-antraggeburt-ui/auswahl",
  category: child_benefit_category,
  pregnancy: pregancy_one
)

Task.create!(
  name: "Find mother & father birth certificates",
  description: "Ask in your homecountry",
  start_time: 30,
  deadline: 36,
  category: birth_certificate_category,
  pregnancy: pregancy_one
)

Task.create!(
  name: "Registering the child to the registry office (Standesamt)",
  description: "Within a week after the birth, register your baby to the registery office in which your baby is born or directly at the hospital. They will issue the birth certificate.
                Required documents:
                  -Birth announcement will be send by the hospital
                  -Declaration of both parents about the first name and surname of the child (signed)
                  -Valid identity card or passport of parents
                  - mother's and father's birth certificate
                  - if applicable, marriage certificate",
  start_time: 40,
  deadline: 41,
  form_url_de: "https://drive.google.com/file/d/1VkinWa9dQFZGq0KeL-FRjqTU7_-uRa_X/view?usp=sharing",
  form_url_en: "https://drive.google.com/file/d/1l03b7gN0ovwR5dikkgpGN8BmsYJ92AO3/view?usp=sharing",
  category: birth_certificate_category,
  pregnancy: pregancy_one
)
