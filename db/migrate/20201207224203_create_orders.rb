class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_status
      t.string :order_code
      t.string :order_name
      t.string :order_app

      t.timestamps
    end
  end
end
