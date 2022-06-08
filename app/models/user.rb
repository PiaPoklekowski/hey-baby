class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pregnancies_as_mother, class_name: "Pregnancy", foreign_key: :mother_id
  has_many :pregnancies_as_partner, class_name: "Pregnancy", foreign_key: :partner_id
  has_one :profile, dependent: :destroy

  validates :email, uniqueness: true

  before_create :add_profile

  def pregnancies
    Pregnancy.where(mother: self).or(Pregnancy.where(partner: self))
  end

  def current_pregnancy
    pregnancies.order(due_date: :asc).last
  end

  # private

  def add_profile
    @profile = Profile.new(first_name: "", last_name: "", address: "", birthdate: "", role: "Mother")
    self.profile = @profile
    #@profile.save
  end
end
