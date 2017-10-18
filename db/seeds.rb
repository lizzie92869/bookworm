# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ name: 'lizzie' }, { name: 'luca' }, { name: 'Peter' }])
Book.create(title: "Crazy little thing", book_code: "1", description: "feets on the beach", cover_image_file_name: "book1.png", cover_image_content_type: "image", cover_image_file_size: 97, chapters_count: 1)