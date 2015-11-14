# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ title: 'Apparel' }, { title: 'Snowboards' }])

Category.first
  .items
  .create([{ name: 'Hoody',
             description: 'Keeps you slightly warm',
             price: 80,
             image: File.open('app/assets/images/hoody.jpg')
                 },

           { name: 'Sweet Jacket',
             description: 'Keeps you warm',
             price: 240,
             image: File.open('app/assets/images/jacket.jpg')
            }])

Category.last
  .items
  .create([{ name: 'gwar possum',
             description: 'a snowboard for gwar concerts',
             price: 15,
             image: File.open('app/assets/images/gwar_possum.jpg')
                 },

           { name: 'gnar possum',
             description: 'a snowboard for shredding gnar pow',
             price: 1000,
             image: File.open('app/assets/images/gnar_possum.jpg')
           }])
