class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  scope :verified, -> {where(verified: "verified")}
  scope :notVerified, -> {where(verified: "not verified")}
  scope :notbanned, -> {where(banned: "not banned")}
  scope :banned, -> {where(banned: "banned")}
  
  enum gender: [:Male,:Female,:Other]
  enum marital_status: [:Married,:Single,:Seperated,:Divorced]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments , dependent: :destroy
  has_many :medications , dependent: :destroy
  has_many :tests, dependent: :destroy
end
