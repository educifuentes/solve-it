class Order < ApplicationRecord
  belongs_to :user
  belongs_to :services_technician
  belongs_to :tip, optional: true
  belongs_to :cancelled_feedback, optional: true

  has_many :reviews, dependent: :destroy
  monetize :amount_cents
end
