class AddMeetingUrlToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :meeting_url, :string
  end
end
