class CreateServicesTechnicians < ActiveRecord::Migration[6.0]
  def change
    create_table :services_technicians do |t|
      t.references :service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :fee_amount
      t.string :fee_currency

      t.timestamps
    end
  end
end
