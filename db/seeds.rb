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
    gender: "Boy",
    mother: user_one
  )

p pregancy_one
CATEGORIES.each do |category|
  Category.create!(
    name: category,
    description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua"
  )
end

hospital_category = Category.find_by(name: "Hospital")
child_benefit_category = Category.find_by(name: "Child benefit")
birth_certificate_category = Category.find_by(name: "Birth certificate")

Task.create!(
  name: "Find a hospital and book an appointment",
  description: "If you wish to give birth at a birthing centre or elsewhere with a midwife in attendance, early application is needed.
  You can register later at a hospital. This registration is not binding.",
  start_time: 20,
  deadline: 30,
  category: hospital_category,
  pregnancy: pregancy_one
)


Task.create!(
  name: "Visit and register in your Hospital",
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
  deadline: 48,
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
  description: "Within a week after the birth, register your baby to the registery office in which your baby is born or directly at the hospital.
              They will issue the birth certificate.\n
               Required documents:\n
              • Birth announcement will be send by the hospital\n
               • Declaration of both parents about the first name and surname of the child (signed)
               \n• Valid identity card or passport of parents
               \n• mother's and father's birth certificate
               \n•if applicable, marriage certificate",
  start_time: 40,
  deadline: 41,
  form_url_de: "https://drive.google.com/file/d/1VkinWa9dQFZGq0KeL-FRjqTU7_-uRa_X/view?usp=sharing",
  form_url_en: "https://drive.google.com/file/d/1l03b7gN0ovwR5dikkgpGN8BmsYJ92AO3/view?usp=sharing",
  category: birth_certificate_category,
  pregnancy: pregancy_one
)

puts "Creating 17 hospitals in Berlin..."

Hospital.create!(
  name: "Vivantes Klinikum Friedrichshain",
  address: "Landsberger Allee 49, 10249 Berlin, Friedrichshain",
  website: "termin.vivantes.de/Geburtsmedizin"
)

Hospital.create!(
  name: "Sankt Gertrauden Krankenhaus",
  address: "Paretzer Str. 11,10713 Berlin, Wilmersdorf",
  website: "sankt-gertrauden.de/geburtshilfe/"
)

Hospital.create!(
  name: "Vivantes Klinikum am Urban",
  address: "Dieffenbachstr. 1, 10967 Berlin, Kreuzberg",
  website: "termin.vivantes.de/Geburtsmedizin"
)

Hospital.create!(
  name: "St. Joseph-Krankenhaus",
  address: "Bäumerplan 24, 12101 Berlin, Tempelhof",
  website: "www.sjk.de/kliniken/klinik-geburtshilfe/anmeldung-zur-geburt.html"
)

Hospital.create!(
  name: "Vivantes Auguste-Viktoria Klinikum",
  address: "Rubensstr. 125, 12157 Berlin",
  website: "termin.vivantes.de/Geburtsmedizin"
)

Hospital.create!(
  name: "Vivantes Klinikum Neukölln",
  address: "Rudower Str. 48, Kormoranweg 45, 12351 Berlin, Neukölln",
  website: "www.vivantes.de/klinikum-neukoelln/fachbereiche/kliniken/geburtsmedizin"
)

Hospital.create!(
  name: "DRK-Kliniken Köpenick",
  address: "Salvador-Allende-Str. 2 -8, 12557 Berlin, Köpenick",
  website: "www.drk-kliniken-berlin.de/geburtshilfe-koepenick"
)

Hospital.create!(
  name: "Helios Kliniken Berlin-Buch",
  address: "Schwanebecker Chaussee 50, 13125 Berlin, Buch",
  website: "www.helios-gesundheit.de/kliniken/berlin-buch/unser-angebot/unsere-fachbereiche/geburtshilfe/anmeldung-zur-geburt/"
)

Hospital.create!(
  name: "Maria Heimsuchung Caritas Klinik Pankow",
  address: "Breitestr. 46 - 47,13187 Berlin, Pankow",
  website: "www.caritas-klinik-pankow.de/unsere-abteilungen/geburtshilfe/"
)

Hospital.create!(
  name: "Klinik für Geburtsmedizin - Charité - Campus Virchow Klinikum",
  address: "Augustenburger Platz 1, 13353 Berlin, Wedding",
  website: "geburtsmedizin.charite.de"
)

Hospital.create!(
  name: "Vivantes Humboldt-Klinikum",
  address: "Am Nordgraben 2, 13509 Berlin, Reinickendorf",
  website: "www.vivantes.de/humboldt-klinikum/geburtsmedizin"
)

Hospital.create!(
  name: "Ev. Waldkrankenhaus Spandau",
  address: "Stadtrandstr. 555 - 561, 13589 Berlin, Spandau",
  website: "www.johannesstift-diakonie.de/medizinische-versorgung/evangelisches-waldkrankenhaus-spandau/behandlung/geburtshilfe-neonatologie/anmeldung-zur-geburt/"
)

Hospital.create!(
  name: "DRK-Kliniken Westend",
  address: "Spandauer Damm 130, 14050 Berlin, Charlottenburg",
  website: "www.drk-kliniken-berlin.de/geburtshilfe-perinatalmedizin-westend"
)

Hospital.create!(
  name: "Gemeinschaftskrankenhaus Havelhöhe",
  address: "Kladower Damm 221, 14089 Berlin, Spandau",
  website: "www.havelhoehe.de/anmeldung-geburtshilfe.html"
)

Hospital.create!(
  name: "Krankenhaus Waldfriede",
  address: "Argentinische Allee 40, 14163 Berlin, Zehlendorf",
  website: "www.krankenhaus-waldfriede.de/en/medicine-and-care/expecting-parents/office-and-registration"
)

Hospital.create!(
  name: "Martin-Luther-Krankenhaus",
  address: "Caspar-Theyß-Str. 27 - 31, 14193 Berlin, Grunewald",
  website: "www.pgdiakonie.de/martin-luther-krankenhaus/kliniken-einrichtungen/geburtshilfe/"
)
