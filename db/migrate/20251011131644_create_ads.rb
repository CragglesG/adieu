class CreateAds < ActiveRecord::Migration[8.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.float :selling_price

      t.timestamps
    end
  end
end
