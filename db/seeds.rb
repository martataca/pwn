# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create!(type: 'Mentee', firstName: 'Maria', lastName: 'Francisca', email: 'mariazinha@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedamaria', phone_number: '919293949', submitted: false, years_experience: 5, company: "Accenture", availability_8: "Available", select1: false)

@user = User.create!(type: 'Mentee', firstName: 'Tomé', lastName: 'Alves', email: 'talves@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedotomé', phone_number: '96939495', submitted: false, years_experience: 5, company: "Accenture", availability_8: "Available", select1: false)

@user = User.create!(type: 'Mentor', firstName: 'Bruno', lastName: 'Duarte', email: 'bruninho@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedobruno', phone_number: '21999654', submitted: false, years_experience: 5, company: "Accenture", availability_8: "Available", select1: false)

@user = User.create!(type: 'Mentor', firstName: 'Inês', lastName: 'Viana', email: 'maildaines@gmail.com', password: '12345678')
Profile.create!(user_id: @user.id, skype_name: 'skypedoines', phone_number: '98745632', submitted: false, years_experience: 5, company: "Accenture", availability_8: "Available", select1: false)

@mentee = Mentee.create!(firstName: 'Francisca', lastName: 'Mendes', email: 'fm@gmail.com', password: '12345678')
@profile = Profile.create!(firstName: @mentee.firstName, surnames: @mentee.lastName, user_id: @mentee.id, submitted: false, years_experience: 5, company: "EDP", availability_18: "Available", select1: false)

@mentee = Mentee.create!(firstName: 'Margarida', lastName: 'Costa', email: 'mc@gmail.com', password: '12345678')
@profile = Profile.create!(firstName: @mentee.firstName, surnames: @mentee.lastName, user_id: @mentee.id, submitted: false, years_experience: 4, company: "EDP", availability_18: "Available", select1: false)

@mentee = Mentee.create!(firstName: 'Irene', lastName: 'Gois', email: 'ig@gmail.com', password: '12345678')
@profile = Profile.create!(firstName: @mentee.firstName, surnames: @mentee.lastName, user_id: @mentee.id, submitted: false, years_experience: 5, company: "EDP", availability_18: "Available", select1: false)

@mentee = Mentee.create!(firstName: 'Maria João', lastName: 'Jardim', email: 'mjj@gmail.com', password: '12345678')
@profile = Profile.create!(firstName: @mentee.firstName, surnames: @mentee.lastName, user_id: @mentee.id, submitted: false, years_experience: 5, company: "EDP", availability_18: "Available", select1: false)

@mentee = Mentee.create!(firstName: 'Mariana', lastName: 'Oliveira', email: 'mo@gmail.com', password: '12345678')
@profile = Profile.create!(firstName: @mentee.firstName, surnames: @mentee.lastName, user_id: @mentee.id, submitted: false, years_experience: 5, company: "Accenture", availability_8: "Available", select1: false)

@mentor = Mentor.create!(firstName: 'David', lastName: 'Mouzinho', email: 'dm@gmail.com', password: '12345678')
