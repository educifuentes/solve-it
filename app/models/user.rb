class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :services_technicians
  has_many :services, through: :services_technicians

  validates :role, :name, presence: true
  validates :role, inclusion: { in: %w[customer technician] }
  validates :email, uniqueness: true
end
