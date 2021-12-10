class RemoveNullConstraintFromOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:orders, :tip_id, true)
    change_column_null(:orders, :cancelled_feedback_id, true)
  end
end
