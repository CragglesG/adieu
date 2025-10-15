class AddPayPerViewToAds < ActiveRecord::Migration[8.0]
  def change
    add_column :ads, :pay_per_view, :boolean
  end
end
