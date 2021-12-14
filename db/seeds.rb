# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroy before seeding
if Rails.env.development?
  Order.destroy_all
  ServicesTechnician.destroy_all
  User.destroy_all
  Service.destroy_all
  Category.destroy_all
end

# Users
User.new(email: "edu@lewagon.com", name: "Eduardo", role: "customer", password: "123456").save
User.new(email: "fer@lewagon.com", name: "Fernando", role: "customer", password: "123456").save
User.new(email: "manu@lewagon.com", name: "Manuel", role: "customer", password: "123456").save
User.new(email: "julio@lewagon.com", name: "Julio", role: "customer", password: "123456").save

# Technicians
User.new(email: "pablo@lewagon.com", name: "Pablo", role: "technician", password: "123456").save
User.new(email: "javier@lewagon.com", name: "Javier", role: "technician", password: "123456").save
User.new(email: "rosa@lewagon.com", name: "Rosa", role: "technician", password: "123456").save
User.new(email: "camila@lewagon.com", name: "Camila", role: "technician", password: "123456").save

# Main Categories
Category.new(name: "Laptop", icon: "fas fa-laptop").save!
Category.new(name: "Smartphone", icon: "fas fa-laptop").save!
Category.new(name: "Printer", icon: "fas fa-print").save!
Category.new(name: "Smart TV", icon: "fas fa-tv").save!

# Services
category = Category.find_by(name: "Laptop")
service = Service.new(name: "Format Operating System - Mac", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Laptop")
service = Service.new(name: "Unable to Connect to WiFi networks", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Laptop")
service = Service.new(name: "Battery Doesn’t Charge", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Printer")
service = Service.new(name: "Connect printer to Wi-fi", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Printer")
service = Service.new(name: "Bad print quality.", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Printer")
service = Service.new(name: "Too many paper jams.", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Smartphone")
service = Service.new(name: "Assistance on installing app", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Smart TV")
service = Service.new(name: "Assistance on setting up TV", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Smart TV")
service = Service.new(name: "No sound output", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

category = Category.find_by(name: "Smartphone")
service = Service.new(name: "Connecting problem with Bluetooth, wifi, cellular networks", description: Faker::Lorem.sentence(word_count: 12))
service.category = category
service.save!

# Services Technician
services_technician = ServicesTechnician.new(price: rand(5..10))
services_technician.service = Service.third
services_technician.user = User.where(role: "technician").third
services_technician.save!

services_technician_two = ServicesTechnician.new(price_cents: rand(500..1000))
services_technician_two.service = Service.second
services_technician_two.user = User.where(role: "technician").second
services_technician_two.save!

services_technician_three = ServicesTechnician.new(price_cents: rand(500..1000))
services_technician_three.service = Service.first
services_technician_three.user = User.where(role: "technician").first
services_technician_three.save!

services_technician_fourth = ServicesTechnician.new(price: rand(5..10))
services_technician_fourth.service = Service.first
services_technician_fourth.user = User.where(role: "technician").fourth
services_technician_fourth.save!

# Orders
order = Order.new(
  start: DateTime.now - 1.hour,
end: DateTime.now,
status: "completed",
amount_cents: services_technician.price_cents
)
order.user = User.where(role: "customer", email: "edu@lewagon.com").first
order.services_technician = services_technician
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
end: DateTime.now,
status: "completed",
amount_cents: services_technician_two.price_cents
)
order.user = User.where(role: "customer", email: "fer@lewagon.com").first
order.services_technician = services_technician_two
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
end: DateTime.now,
status: "completed",
amount_cents: services_technician_three.price_cents

)
order.user = User.where(role: "customer", email: "manu@lewagon.com").first
order.services_technician = services_technician_three
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
end: DateTime.now,
status: "completed",
amount_cents: services_technician_fourth.price_cents
)
order.user = User.where(role: "customer", email: "julio@lewagon.com").first
order.services_technician = services_technician_fourth
order.save!
