class AddPriceToServicesTechnician < ActiveRecord::Migration[6.0]
  def change
    add_monetize :services_technicians, :price, currency: { present: false }
    remove_column :services_technicians, :fee_amount
    remove_column :services_technicians, :fee_currency
  end
end
