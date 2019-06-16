# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#User.create(first: 'Admin',last: 'Admin', email: 'admin@admin.com',encrypted_password: 'admin123')

user = User.new
user.first = 'admin'
user.last = 'admin'
user.email = 'admin@admin.com'
user.password = 'admin123'
user.secret = 'test'
user.save!
