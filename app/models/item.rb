class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    validates :sell_price, numericality: { only_integer: true, message: 'Half-width number' }
  end

  validates :sell_price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
end
