class RenameServicesTechnicianColumnToOrders < ActiveRecord::Migration[6.0]
  change_table :orders do |t|
    t.rename :service_technician_id, :services_technician_id
  end
end
