class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :order_status
      t.text :order_code
      t.text :order_name
      t.text :order_app

      t.timestamps
    end
  end
end
