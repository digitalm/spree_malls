module Spree
  class AddOnMall < ActiveRecord::Base
    has_many :add_on_mall_prices
    acts_as_paranoid

    validates :name, presence: true
    validates_uniqueness_of :name
    accepts_nested_attributes_for :add_on_mall_prices
  end
end