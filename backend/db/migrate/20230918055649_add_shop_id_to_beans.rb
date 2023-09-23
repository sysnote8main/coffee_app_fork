class AddShopIdToBeans < ActiveRecord::Migration[7.0]
  def change
    add_reference :beans, :shop, foreign_key: true
  end
end
