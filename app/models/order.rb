class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service_technician
  belongs_to :tip
  belongs_to :cancelled_feedback
end
