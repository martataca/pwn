# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(firstName: 'Maria', lastName: 'Francisca', email: 'mariazinha@gmail.com', password: '12345678')
User.create!(firstName: 'Tomé', lastName: 'Alves', email: 'talves@gmail.com', password: '12345678')
User.create!(firstName: 'Bruno', lastName: 'Duarte', email: 'bruninho@gmail.com', password: '12345678')
User.create!(firstName: 'Inês', lastName: 'Viana', email: 'maildaines@gmail.com', password: '12345678')