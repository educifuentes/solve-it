class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service_technician, null: false, foreign_key: { to_table: :services_technicians }
      t.timestamp :start
      t.timestamp :end
      t.string :status
      t.references :tip, null: false, foreign_key: true
      t.references :cancelled_feedback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
