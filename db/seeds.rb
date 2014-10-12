# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create!(type: 'Mentee', firstName: 'Maria', lastName: 'Francisca', email: 'mariazinha@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedamaria', phone_number: '919293949')

@user = User.create!(type: 'Mentee', firstName: 'Tomé', lastName: 'Alves', email: 'talves@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedotomé', phone_number: '96939495')

@user = User.create!(type: 'Mentor', firstName: 'Bruno', lastName: 'Duarte', email: 'bruninho@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedobruno', phone_number: '21999654')

@user = User.create!(type: 'Mentor', firstName: 'Inês', lastName: 'Viana', email: 'maildaines@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedoines', phone_number: '98745632')

@mentee = Mentee.create!(firstName: 'Francisca', lastName: 'Mendes', email: 'fm@gmail.com', password: '12345678')

@mentor = Mentor.create!(firstName: 'David', lastName: 'Mouzinho', email: 'dm@gmail.com', password: '12345678')
