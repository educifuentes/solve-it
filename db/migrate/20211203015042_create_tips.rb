class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips do |t|
      t.float :amount
      t.string :currency

      t.timestamps
    end
  end
end
