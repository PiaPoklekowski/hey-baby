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

user_one = User.create!(
    email: "heybabyberlin@gmail.com",
    password: "123456"
  )

  p user_one

  pregnancy_one = Pregnancy.create!(
    due_date: Date.new(2022, 12, 15),
    baby_nickname: "Tupac",
    pregnancy_week: 11,
    gender: "Boy",
    mother: user_one
  )

p pregnancy_one

# ------------------------- CATEGORIES HERE --------------------------------#

hospital_category = Category.new(name: "Hospital", description: "If you wish to give birth at a birthing centre or
                                  elsewhere with a midwife in attendance, early application is needed.
                                  You can register later at a hospital. This registration is not binding.")
hospital_category.save!

child_benefit_category = Category.new(name: "Child benefit", description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
                                      sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua")
child_benefit_category.save!

birth_certificate_category = Category.new(name: "Birth certificate", description: "Lorem ipsum dolor sit amet, consetetur
                                            sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua")
birth_certificate_category.save!

gynecologist_category = Category.new(name: "Gynecologist", description: "If you get the blue line or positive symbol or
                                      whatever indicates that YES! you are pregnant, it is time to make an appointment
                                      with your gynecologist (OB/GYN), aka die Frauenarzt. They generally recommend that
                                      you wait until eight weeks after conception.")
gynecologist_category.save!

maternity_leave_category = Category.new(name: "Maternity leave", description: "The maternity leave period is a period of
                                          several weeks before and after the birth.
                                          You are not allowed to work during this period.")
maternity_leave_category.save!

maternity_allowance_category = Category.new(name: "Maternity allowance", description: "inform your Krankenkasse of your
                                              pregnancy (pregnancy certificate) and your starting date of Maternity Leave (Mutterschutz)")
maternity_allowance_category.save!

paternity_category = Category.new(name: "Paternity acknowledgment", description: "If you are not married to the child's mother, you can
                                  acknowledge your paternity before or after the birth of your child at the registry office
                                  or youth welfare office.")
paternity_category.save!

# ---------------------------- TASKS HERE ------------------------------------#
Task.create!(
  name: "Acknowledgment of paternity",
  description: "If your are not married, your have to do the acknowledgment of paternity (Vaterschaftsanerkennung) in your
                current distict office (Standesamt).
                You will find g¡the needed information on the link below.",
  start_time: 17,
  deadline: 24,
  form_url_de: "https://service.berlin.de/dienstleistung/318991/#:~:text=Die%20Vaterschaftsanerkennung%20kann%20nur%20pers%C3%B6nlich,des%20Kindes%20sprechen%20ausreichend%20Deutsch.",
  category: paternity_category,
  pregnancy: pregnancy_one
)


Task.create!(
  name: "Inform your employer about your pregnancy",
  description: "You and your partner should inform your employers about your pregnancy.  Get an email confirmation from
                both of your employers concerning the aknowledgment of your pregnancy",
  start_time: 13,
  deadline: 20,
  category: maternity_leave_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Your maternity leave before the birth starts!",
  description: "The maternity leave begins 6 weeks before the expected date of birth and usually ends 8 weeks after birth.",
  start_time: 35,
  deadline: 40,
  category: maternity_leave_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Reporting the birth to employer",
  description: "This notification can be done orally or in writing. A mother must not work during the first eight weeks
                after giving birth because of the maternity protection period (Mutterschutz). If the child was premature,
                if the mother had twins, triplets etc. or if the child was born with a disability, this period can be
                  extended to 12 weeks.",
  start_time: 40,
  deadline: 42,
  category: maternity_leave_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Apply for the maternity Allowance",
  description: "You should apply for your matternity allowance (Mutterschaftsgeld) at least one week before the
              start of maternity protection period.
              If you are expecting a baby, you will receive maternity benefit as a statutory benefit for six weeks
              before and eight weeks after the birth. The prerequisite for this is that you are in an employment relationship.",
  start_time: 25,
  deadline: 32,
  category: maternity_allowance_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Reporting the birth to your Krankenkasse",
  description: "Once you receive your child Birth certificate, send the correct one to your Krankenkasse by post",
  start_time: 42,
  deadline: 44,
  category: maternity_allowance_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "First examination ultrasound scan",
  description: "The first ultrasound examination (Ultraschalluntersuchung) generally takes place between the 9th and 12th week of pregnancy.
                Its main purpose is to confirm the pregnancy and to check whether the embryo has implanted in the uterus.
                The beating heart of the embryo can be seen and the doctor can assess the external shape of the body.
                It is also possible to determine whether it is a multiple pregnancy. In addition, the current week of
                pregnancy and the expected date of birth can now be determined more precisely than at a later point in time in the pregnancy.
                You will receive from your Gynecologist your Mutterpass documents. ",
  start_time: 9,
  deadline: 12,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Get your pregnancy certificate from your Gynecologist",
  description: "The pregnancy certificate (bescheinigung für schwangerschaft) cost 5euros and should be refund by the employer",
  start_time: 11,
  deadline: 12,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Second examination",
  description: "For the second ultrasound examination between the 19th and 22nd week of pregnancy, you can choose between two examinations:
                the basic ultrasound examination and the extended basic ultrasound examination.
                In the basic ultrasound examination, the age-appropriate development of the child is checked. Individual
                organs are not examined in more detail. Rather, the size of the head and abdomen and the length of the
                thigh bone are measured and the amount of amniotic fluid is determined. The position of the placenta in
                the uterus is also checked. If there are any abnormalities, they can be clarified by further examinations.
                In the extended basic ultrasound examination, the head, brain chambers and cerebellum are also examined
                more closely and the size ratio of the chest and heart is measured. The heartbeat and the position and
                size of the ventricles are also checked. It is also checked whether the abdominal wall and the spine are
                closed and whether the stomach and bladder are visible.
                Both the basic ultrasound and the extended basic ultrasound are services provided by statutory health
                insurance companies. They can only be carried out by gynecologists with the appropriate qualifications.
                If the doctor treating you does not have this qualification, you will need to be referred to another
                gynecological practice for this examination.",
  start_time: 19,
  deadline: 22,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Anatomy ultrasound (Feindiagnostik) or 3D scan",
  description: "In addition, most people get an anatomy ultrasound (Feindiagnostik) or 3D scan. Your doctor should
                recommend a specialist around the 25th week. You will receive a referral and can usually make an appointment
                fairly quickly. This scan is a fascinating chance to see your baby in the flesh and diagnose serious issues.
                Babies like covering their face with their hands during this exciting exam so don't be alarmed if the doctor
                manually manipulates your belly to get a better look. The look at your baby's face is worth the mild discomfort!
                The doctor and technician will measure everything from the thigh bone to the cranial ridges and examine
                the output of various organs. Indicators of spina bifida and Down syndrome may be identified, but note
                that it is impossible to determine every possible issue. This is merely a stepping stone to identify early problems. ",
  start_time: 24,
  deadline: 26,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Gestational diabetes test",
  description: "A Schwangerschaftsdiabetes test (for gestational diabetes) is administered between 24 to 28 weeks.",
  start_time: 24,
  deadline: 28,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Third examination",
  description: "The third ultrasound examination is planned between the 29th and 32nd week of pregnancy and serves to assess
                the age-appropriate development and the position of the child. The placenta and the amount of amniotic fluid
                are also checked again. This information is important for birth planning. If there are any abnormalities,
                further examinations can be arranged.",
  start_time: 29,
  deadline: 32,
  category: gynecologist_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Find a hospital and book an appointment",
  description: "If you wish to give birth at a birthing centre or elsewhere with a midwife in attendance, early application is needed.
  You can register later at a hospital. This registration is not binding.",
  start_time: 20,
  deadline: 30,
  category: hospital_category,
  pregnancy: pregnancy_one
)


Task.create!(
  name: "Visit and register in your Hospital",
  description: "Onsite interview with a Midwife. Explain your birth type wishes and questions (waterbirth, natural birth..., room wishes)",
  start_time: 22,
  deadline: 25,
  category: hospital_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Applying for child benefit (Kindergeld)",
  description: "As soon as the birth certificate is available - Create! an account and fill in the form, print, sign and scan and send it to the given address",
  start_time: 44,
  deadline: 48,
  form_url_de: "https://web.arbeitsagentur.de/opal/kgo-antraggeburt-ui/auswahl",
  category: child_benefit_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Find mother & father birth certificates",
  description: "Ask in your homecountry",
  start_time: 30,
  deadline: 36,
  category: birth_certificate_category,
  pregnancy: pregnancy_one
)

Task.create!(
  name: "Registering the child to the registry office (Standesamt)",
  description: "Within a week after the birth, register your baby to the registery office in which your baby is born or directly at the hospital.
              They will issue the birth certificate.",
  start_time: 40,
  deadline: 41,
  form_url_de: "https://drive.google.com/file/d/1VkinWa9dQFZGq0KeL-FRjqTU7_-uRa_X/view?usp=sharing",
  form_url_en: "https://drive.google.com/file/d/1l03b7gN0ovwR5dikkgpGN8BmsYJ92AO3/view?usp=sharing",
  category: birth_certificate_category,
  pregnancy: pregnancy_one
)

# ---------------------------- HOSPITALS HERE -----------------------------------#

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
