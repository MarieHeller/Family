# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Fam.destroy_all

user1 = User.create!(first_name: 'David',
  last_name: 'Marciano',
  email: 'davidmarciano@gmail.com',
  password: '123456',
  language: 'french',
  description: 'Renting families has been my true passion since 1997!',
  age: '23',
  nationality: 'swiss',
  gender: 'male',
  )

user2 = User.create!(first_name: 'Jimmy',
  last_name: 'Marciano',
  email: 'jimmymarciano@gmail.com',
  password: '123456',
  language: 'french',
  description: 'Renting families is my brother true passion since 1997',
  age: '28',
  nationality: 'swiss',
  gender: 'male',
  )

user3 = User.create!(first_name: 'Michel',
  last_name: 'Drucker',
  email: 'mrdrucker@gmail.com',
  password: '123456',
  language: 'french',
  description: 'I wish I could also rent my family but no one likes us...',
  age: '75',
  nationality: 'french',
  gender: 'male',
  )

user4 = User.create!(first_name: 'Javier',
  last_name: 'Peña',
  email: 'agentepena@gmail.com',
  password: '123456',
  language: 'english',
  description: 'Americano-colombian cops looking for a pleasant family to welcome me',
  age: '35',
  nationality: 'colombian',
  gender: 'male',
  )

user5 = User.create!(first_name: 'Angela',
  last_name: 'Merkel',
  email: 'queenangela@gmail.de',
  password: '123456',
  language: 'german',
  description: 'Germany is a lovely country! Come & meet my fam ;)',
  age: '68',
  nationality: 'german',
  gender: 'female',
  )

fam = Fam.create!(
  name: "The Marcianos",
  members: 6,
  price: 1000,
  cultural_experience: "Morrocan Jews",
  language: "french",
  housing_type: "house",
  location: "Switzerland",
  description: "Finishing a feature Using branches, we work on different parts of a project at the same time. When a feature is finished, we’d like to merge commits back in master.How?",
  capacity: 4,
  user: user3
  )

