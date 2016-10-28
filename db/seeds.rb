# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Berita", subcategories:[
    Subcategory.new(name: "National"),
    Subcategory.new(name: "Ekonomi Syariah"),
    Subcategory.new(name: "Ekobis"),
    Subcategory.new(name: "Politik"),
    Subcategory.new(name: "Kampung Halaman"),
    Subcategory.new(name: "International"),
    Subcategory.new(name: "Olahraga")
])

Category.create(name: "Sulawesi tengah", subcategories:[
    Subcategory.new(name: "Lembah Palu"),
    Subcategory.new(name: "Palu Eo Eo"),
    Subcategory.new(name: "Daerah")
])

Category.create(name: "Bola")
Category.create(name: "Ketua Utama Menjawab")

Category.create(name: "Alkhairaat", subcategories:[
    Subcategory.new(name: "PB Alkhairaat"),
    Subcategory.new(name: "Abnaulkhairaat"),
    Subcategory.new(name: "Madrazah"),
    Subcategory.new(name: "Sirah")
])

Category.create(name: "Tazkiyah", subcategories:[
    Subcategory.new(name: "Khotbah"),
    Subcategory.new(name: "Syarah Hadist"),
    Subcategory.new(name: "Muallaf"),
    Subcategory.new(name: "Sakinah")
])

Category.create(name: "Jazirah")
Category.create(name: "Lensa")

Category.create(name: "Kolom Kita", subcategories:[
    Subcategory.new(name: "Pembaca Menulis"),
    Subcategory.new(name: "Opini"),
    Subcategory.new(name: "Suara redaksi")
])





