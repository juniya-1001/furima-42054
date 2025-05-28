class OrdersAddresses
  include ActiveModel::Model
  attr_accessor :zipcode, :perfecture, :city, :street, :building, :tel_phone

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
