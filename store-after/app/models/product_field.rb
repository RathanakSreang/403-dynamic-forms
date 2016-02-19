class ProductField < ActiveRecord::Base
  belongs_to :product_type
  attr_accessible :field_type, :name, :required, :product_type_id
end
