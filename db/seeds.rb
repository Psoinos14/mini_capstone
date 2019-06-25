# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

wig = Product.new(name: "wig", price: 20, image_url: "https://partycity6.scene7.com/is/image/PartyCity/_sq_?$_500x500_$&$product=PartyCity/793219_full", description: "a beautiful wig!!")
wig.save

sweatshirt = Product.new(name: "sweatshirt", price: 55, image_url: "https://i.ebayimg.com/images/g/Y8kAAOSwKUhZtlXO/s-l300.jpg", description: "a cool sweatshirt with a wolf")

sweatshirt.save