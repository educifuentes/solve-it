class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.references :technician_id, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
