# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

voiture = Category.create(title: 'Voiture')
maison = Category.create(title: 'Maison')
service = Category.create(title: 'Service')
emploi = Category.create(title: 'Emploi')