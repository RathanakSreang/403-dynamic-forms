# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ProductType.create! name: "Clothes"
["Color", "Size", "Withd", "Height"].each do |name|
  ProductField.create! name: "#{name}",
                        required: false,
                        product_type_id: 1,
                        field_type: "textbox"
end
6.times do |n|
  Product.create! name: "Name One To Three",
                  price: 123* n,
                  product_type_id: 1,
                  properties: {
                    "Color"=> n%2==0 ? "RED" : "GREEN",
                    "Size"=> n>=2 ? "XL" : "S-#{n}",
                    "Withd"=> "W",
                    "Height"=> n>2 ? "H" : "H-#{n}"
                  }
end