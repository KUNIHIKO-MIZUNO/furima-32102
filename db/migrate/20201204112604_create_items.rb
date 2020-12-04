class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,            null: false
      t.string     :price,                null: false
      t.text       :explain,              null: false
      t.integer    :category_id,          null: false
      t.integer    :condition_id,         null: false
      t.integer    :delivery_cost_id,     null: false
      t.integer    :prefecture_id,        null: false
      t.integer    :delivery_how_long_id, null: false
      t.references :user,                 foreign_key: true
      t.timestamps
    end
  end
end
