module Spree
  Variant.class_eval do
    has_many :add_on_mall_prices, class_name: 'Spree::AddOnMallPrice'

#   enable variants to CRUD each own add_on_maker_variants by accept nesting as child
    accepts_nested_attributes_for :add_on_mall_prices, allow_destroy: true

  end
end
