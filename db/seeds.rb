# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([{ title: 'Apparel' }, { title: 'Snowboards' }, { title: 'Boots' }, { title: 'Bindings' }])

apparel = Category.find_by(title: "Apparel")
  .items
  .create([{ name: 'Hoody',
             description: 'Keeps you slightly warm',
             price: 80,
             brand: "Nomis",
             image: File.open('app/assets/images/hoody.jpg')
                 },

           { name: 'Sweet Jacket',
             description: 'Keeps you warm',
             price: 240,
             brand: "NEFF",
             image: File.open('app/assets/images/jacket.jpg')
            }])

snowboards = Category.find_by(title: "Snowboards")
  .items
  .create([{ name: 'gwar possum',
             description: 'a snowboard for gwar concerts',
             price: 15,
             brand: "Jibberish",
             image: File.open('app/assets/images/gwar_possum.jpg')
                 },

           { name: 'gnar possum',
             description: 'a snowboard for shredding gnar pow',
             price: 1000,
             brand: "Never Summer",
             image: File.open('app/assets/images/gnar_possum.jpg')
           }])

boots = Category.find_by(title: "Boots")
.items
.create([{ name: 'cool boots',
           description: 'These boots were made for shreddin',
           price: 200,
           brand: "Ride",
           image: File.open('app/assets/images/boots1.jpg')
               },

         { name: 'gnar kicks',
           description: 'Foot-tappin-good boots. These puppies will keep you warm.',
           price: 150,
           brand: "Thirty-Two",
           image: File.open('app/assets/images/boot2.jpg')
         }])

  bindings = Category.find_by(title: "Bindings")
  .items
  .create([{ name: 'Foot Binders',
            description: 'These things are most-necessary, they keep your feet on the board',
            price: 300,
            brand: "Ride",
            image: File.open('app/assets/images/bidndings1.jpg')
                },

          { name: 'Anti-kickflippers',
            description: 'No kickflips allow with the Salomon Anti-kickflippers',
            price: 150,
            brand: "Salomon",
            image: File.open('app/assets/images/bindings2.jpg')
          }])
