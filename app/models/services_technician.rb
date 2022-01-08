class ServicesTechnician < ApplicationRecord
  belongs_to :service
  belongs_to :user

  has_many :orders
  monetize :price_cents

  validates :price, numericality: { greater_than: 0, message: "should be greater than 0" }
end
