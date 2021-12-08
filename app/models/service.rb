class Service < ApplicationRecord
  belongs_to :category

  def label_text
    "#{category.name}  - #{name} "
  end

end
