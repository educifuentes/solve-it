class RemoveTechnicianFromServices < ActiveRecord::Migration[6.0]
  def change
    remove_column :services, :technician_id
  end
end
