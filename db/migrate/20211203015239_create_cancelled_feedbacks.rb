class CreateCancelledFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :cancelled_feedbacks do |t|
      t.string :description
      t.string :problem_type

      t.timestamps
    end
  end
end
