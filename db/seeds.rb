# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Android notifications
# app = Rpush::Gcm::App.new
# app.name = 'android_app'
# app.auth_key = Rails.application.secrets.gcm_sender_id || 'gcm_sender_id'
# app.connections = 1
# app.save

# iOS notifications
# app = Rpush::Apns::App.new
# app.name = 'ios_app'
# app.certificate = File.read(Rails.root.join('config', 'pushcert.pem'))
# app.environment = 'sandbox'
# # app.password = '12345'
# app.connections = 1
# app.save

Admin.create!(email: 'foo@bar.com', password: 'qwerty123')

verification_token = VerificationToken.create!(
  phone_number: '+79991112233',
  code: 1234,
  verified: true
)

user = User.create!(phone_number: '+79991112233')
user.update!(api_token: 'foobar')

order = Order.create!(user: user, due_by: 1.month.from_now)
