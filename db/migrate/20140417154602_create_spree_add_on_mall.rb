class CreateSpreeAddOnMall < ActiveRecord::Migration
  def change
    create_table :spree_add_on_malls do |t|
      t.string     :name
      t.datetime   :deleted_at
      t.timestamps
    end
    create_table :spree_add_on_mall_translations do |t|
      t.integer    :add_on_mall_id
      t.string     :locale
      t.string     :name
      t.timestamps
    end
    create_table :spree_add_on_mall_prices do |t|
      t.integer    :variant_id
      t.integer    :add_on_mall_id
      t.decimal    :amount,         :precision => 8,   :scale => 2
      t.string     :currency
    end
  end
end
