class ServicesTechnician < ApplicationRecord
  belongs_to :service
  belongs_to :user

  has_many :orders
end
