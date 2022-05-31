class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pregnancies_as_mother, class_name: "Pregnancy", foreign_key: :mother_id
  has_many :pregnancies_as_partner, class_name: "Pregnancy", foreign_key: :partner_id

  validates :email, uniqueness: true
end
