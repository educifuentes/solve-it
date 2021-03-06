class Service < ApplicationRecord
  include PgSearch::Model
  belongs_to :category

  has_many :services_technicians
  has_many :users, through: :services_technicians

  def label_text
    "#{category.name}  - #{name} "
  end

  pg_search_scope :search_by_name_and_category,
                  against: [:name],
                  associated_against: { category: :name }, using: {
                    tsearch: { prefix: true }
                  }
end
