class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum gender: [:Male,:Female,:Other]
  enum marital_status: [:Married,:Single,:Seperated,:Divorced]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many  :operations , dependent: :destroy
   has_many :allergies, dependent: :destroy
   has_many :diseases , dependent: :destroy
   has_many :medications, dependent: :destroy
   has_many :medication_histories , dependent: :destroy
   has_many :appointments, dependent: :destroy
   has_many :tests, dependent: :destroy
   has_many :reminders , dependent: :destroy
   has_many :special_habits , dependent: :destroy
   has_one_attached :avatar
   
end
