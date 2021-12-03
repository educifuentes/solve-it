class Service < ApplicationRecord
  belongs_to :category
  belongs_to :technician_id
end
