class FixTechnicianRefToServices < ActiveRecord::Migration[6.0]
  def change
    remove_reference :services, :technician_id, foreign_key: { to_table: :users }
    add_reference :services, :technician, foreign_key: { to_table: :users }
  end
end
