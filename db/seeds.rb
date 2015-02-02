# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all

categories = Category.create([
                              { name: 'Offset Inks' },
                              { name: 'UV Inks' },
                              { name: 'Web Inks' },
                              { name: 'Others' }
                            ])

Product.delete_all
Product.create!(name: 'Product 1',
               remote_photo_url: 'http://localhost:3000/assets/weddings.jpg',
               brief: 'hello hello hello hello hello hello ',
               detail: '<p>world world world world world </p>',
               category_id: categories[0].id)

Product.create(name: 'Product 2',
               remote_photo_url: 'http://localhost:3000/assets/weddings.jpg',
               brief: 'hello hello hello hello hello hello ',
               detail: '<p>world world world world world </p>',
               category_id: categories[1].id)

Product.create(name: 'Product 3',
               remote_photo_url: 'http://localhost:3000/assets/weddings.jpg',
               brief: 'hello hello hello hello hello hello ',
               detail: '<p>world world world world world </p>',
               category_id: categories[2].id)

Product.create(name: 'Product 4',
               remote_photo_url: 'http://localhost:3000/assets/weddings.jpg',
               brief: 'hello hello hello hello hello hello ',
               detail: '<p>world world world world world </p>',
               category_id: categories[3].id)

Product.create(name: 'Product 5',
               remote_photo_url: 'http://localhost:3000/assets/weddings.jpg',
               brief: 'hello hello hello hello hello hello ',
               detail: '<p>world world world world world </p>',
               category_id: categories[3].id)
