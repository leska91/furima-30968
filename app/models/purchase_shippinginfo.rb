class PurchaseShippinginfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は半角数字ハイフンなしで入力してください" }
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Purchase.create(user_id: user.id, item_id: item.id)
    Shippinginfo.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end