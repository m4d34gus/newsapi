# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Berita")
Category.create(name: "National")
Category.create(name: "Ekonomi Syariah")
Category.create(name: "Ekobis")
Category.create(name: "Politik")
Category.create(name: "Kampung Halaman")
Category.create(name: "International")
Category.create(name: "Olahraga")


Category.create(name: "Sulawesi tengah")
Category.create(name: "Lembah Palu")
Category.create(name: "Palu Eo Eo")
Category.create(name: "Daerah")

Category.create(name: "Bola")
Category.create(name: "Ketua Utama Menjawab")

Category.create(name: "Alkhairaat")
Category.create(name: "PB Alkhairaat")
Category.create(name: "Abnaulkhairaat")
Category.create(name: "Madrazah")
Category.create(name: "Sirah")


Category.create(name: "Tazkiyah")
Category.create(name: "Khotbah")
Category.create(name: "Syarah Hadist")
Category.create(name: "Muallaf")
Category.create(name: "Sakinah")


Category.create(name: "Jazirah")
Category.create(name: "Lensa")

Category.create(name: "Kolom Kita")
Category.create(name: "Pembaca Menulis")
Category.create(name: "Opini")
Category.create(name: "Suara redaksi")


User.create(name: "Made Agus", email: "made@madedirawan.com", role: "admin", status: "active", password: '12345678', password_confirmation: '12345678')
User.create(name: "Default", email: "default@newsapp.dev", role: "default", status: "active", password: '12345678', password_confirmation: '12345678')





