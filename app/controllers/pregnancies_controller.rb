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
