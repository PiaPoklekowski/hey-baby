require 'date'

class PregnanciesController < ApplicationController

  def new
    @pregnancy = Pregnancy.new
    authorize @pregnancy
  end

  def create
    @pregnancy = Pregnancy.new(pregnancy_params)
    @pregnancy.mother = current_user
    authorize @pregnancy

    if @pregnancy.save
      hospital_category = Category.find_by(name: "Hospital")
      child_benefit_category = Category.find_by(name: "Child benefit")
      birth_certificate_category = Category.find_by(name: "Birth certificate")
      gynecologist_category = Category.find_by(name: "Gynecologist")
      maternity_leave_category = Category.find_by(name: "Maternity leave")
      maternity_allowance_category = Category.find_by(name: "Maternity allowance")
      paternity_category = Category.find_by(name: "Paternity acknowledgment")

      Task.create!(
        name: "Find a hospital and book an appointment",
        description: "If you wish to give birth at a birthing centre or elsewhere with a midwife in attendance, early application is needed.
        Book an appointment for the registration at the hospital of your choice. You can register later at a hospital. This registration is not binding.",
        start_time: 20,
        deadline: 30,
        category: hospital_category,
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Visit and register in your Hospital",
        description: "Onsite interview with a Midwife. Explain your birth type wishes and questions (waterbirth, natural birth..., room wishes)",
        start_time: 22,
        deadline: 25,
        category: hospital_category,
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Applying for child benefit (Kindergeld)",
        description: "As soon as the birth certificate is available - Create! an account and fill in the form, print, sign and scan and send it to the given address",
        start_time: 44,
        form_url_de: "https://web.arbeitsagentur.de/opal/kgo-antraggeburt-ui/auswahl",
        category: child_benefit_category,
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Find mother & father birth certificates",
        description: "Ask in your homecountry",
        start_time: 30,
        deadline: 36,
        category: birth_certificate_category,
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Get your pregnancy certificate from your Gynecologist",
        description: "The pregnancy certificate (bescheinigung für schwangerschaft) cost 5euros and should be refund by the employer",
        start_time: 11,
        deadline: 12,
        category: gynecologist_category,
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Gestational diabetes test",
        description: "A Schwangerschaftsdiabetes test (for gestational diabetes) is administered between 24 to 28 weeks.",
        start_time: 24,
        deadline: 28,
        category: gynecologist_category,
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Inform your employer about your pregnancy",
        description: "You and your partner should inform your employers about your pregnancy.  Get an email confirmation from
                      both of your employers concerning the aknowledgment of your pregnancy",
        start_time: 13,
        deadline: 20,
        category: maternity_leave_category,
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Your maternity leave before the birth starts!",
        description: "The maternity leave begins 6 weeks before the expected date of birth and usually ends 8 weeks after birth.",
        start_time: 35,
        deadline: 40,
        category: maternity_leave_category,
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
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
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Reporting the birth to your Krankenkasse",
        description: "Once you receive your child Birth certificate, send the correct one to your Krankenkasse by post",
        start_time: 42,
        deadline: 44,
        category: maternity_allowance_category,
        pregnancy: @pregnancy
      )

      Task.create!(
        name: "Acknowledgment of paternity",
        description: "If your are not married, your have to do the acknowledgment of paternity (Vaterschaftsanerkennung) in your
                      current distict office (Standesamt).
                      You will find g¡the needed information on the link below.",
        start_time: 17,
        deadline: 24,
        form_url_de: "https://service.berlin.de/dienstleistung/318991/#:~:text=Die%20Vaterschaftsanerkennung%20kann%20nur%20pers%C3%B6nlich,des%20Kindes%20sprechen%20ausreichend%20Deutsch.",
        category: paternity_category,
        pregnancy: @pregnancy
      )

      # respond_to do |format|
      #   format.html { redirect_to new_important_contact_path }
      redirect_to new_user_invitation_path
      # end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   @pregnancy = Pregnancy.find_by(mother: current_user)
  #   authorize @pregnancy
  # end

  def update
    @pregnancy = Pregnancy.find(params[:id])
    authorize @pregnancy
    @pregnancy.update(pregnancy_params)
    redirect_to profile_path
  end

  private

  def pregnancy_params
    params.require(:pregnancy).permit(:due_date, :baby_nickname, :gender)
  end
end
