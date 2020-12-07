class Order < ApplicationRecord

  validates :order_status, presence: true
  validates :order_code, presence: true
  validates :order_name, presence: true
  validates :order_app, presence: true
end
