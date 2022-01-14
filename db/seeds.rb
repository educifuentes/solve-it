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
technician_pablo = User.new(email: "pablo@lewagon.com", name: "Pablo", role: "technician", password: "123456")
technician_pablo.save!

technician_javier = User.new(email: "javier@lewagon.com", name: "Javier", role: "technician", password: "123456")
technician_javier.save!

technician_rosa = User.new(email: "rosa@lewagon.com", name: "Rosa", role: "technician", password: "123456")
technician_rosa.save!

technician_camila = User.new(email: "camila@lewagon.com", name: "Camila", role: "technician", password: "123456")
technician_camila.save!

technician_julio = User.new(email: "juliotech@lewagon.com", name: "Julio", role: "technician", password: "123456")
technician_julio.save!

# Main Categories
Category.new(name: "computer", icon: "fas fa-laptop").save!
Category.new(name: "smartphone", icon: "fas fa-laptop").save!
Category.new(name: "printer", icon: "fas fa-print").save!
Category.new(name: "smart-tv", icon: "fas fa-tv").save!

# Services
category_computer = Category.find_by(name: "computer")
service1 = Service.new(name: "Fix Computer Connection Issues", description: "Solve Wifi connection issues from your computer")
service1.category = category_computer
service1.save!

service2 = Service.new(name: "Computer Hardware Support", description: "Solve problems with your computer devices")
service2.category = category_computer
service2.save!

service3 = Service.new(name: "Computer Software Support", description: "Solve problems with your computer software")
service3.category = category_computer
service3.save!

category_printer = Category.find_by(name: "printer")
service4 = Service.new(name: "Connect Printer to Wi-fi", description: "Connect your printer to your Wifi")
service4.category = category_printer
service4.save!

service5 = Service.new(name: "Print Quality Support", description: "Solve your Printer quality issues")
service5.category = category_printer
service5.save!

category_smartphone = Category.find_by(name: "smartphone")
service_smartphone1 = Service.new(name: "Assistance on Installing an App", description: "Install the app you need in your smartphone")
service_smartphone1.category = category_smartphone
service_smartphone1.save!

service_smartphone2 = Service.new(name: "Fix Connection Issues", description: "Fix connection issues with your Wifi or Bluetooth")
service_smartphone2.category = category_smartphone
service_smartphone2.save!

category_smart_tv = Category.find_by(name: "smart-tv")
service8 = Service.new(name: "Set Up a Smart TV", description: "Set up your brand new Smart TV")
service8.category = category_smart_tv
service8.save!

service9 = Service.new(name: "Fix Smart-TV Sound Output", description: "Fix your Smart TV sound")
service9.category = category_smart_tv
service9.save!

service_demo = Service.new(name: "Transfer files from a Phone to a Laptop", description: "Transfer or backup any file from your phone to your laptop" )
service_demo.category = category_smartphone
service_demo.save!

# Services Technician
services_technician1 = ServicesTechnician.new(price: rand(5..10))
services_technician1.service = Service.third
services_technician1.user = User.where(role: "technician").third
services_technician1.save!

services_technician2 = ServicesTechnician.new(price_cents: rand(500..1000))
services_technician2.service = Service.second
services_technician2.user = User.where(role: "technician").second
services_technician2.save!

services_technician3 = ServicesTechnician.new(price_cents: rand(500..1000))
services_technician3.service = Service.first
services_technician3.user = User.where(role: "technician").first
services_technician3.save!

services_technician4 = ServicesTechnician.new(price: rand(5..10))
services_technician4.service = Service.first
services_technician4.user = User.where(role: "technician").fourth
services_technician4.save!

services_technician5 = ServicesTechnician.new(price: rand(5..10))
services_technician5.service = service_demo
services_technician5.user = technician_julio
services_technician5.save!

services_technician6 = ServicesTechnician.new(price: rand(5..10))
services_technician6.service = service_smartphone1
services_technician6.user = technician_julio
services_technician6.save!

services_technician7 = ServicesTechnician.new(price: rand(5..10))
services_technician7.service = service_smartphone2
services_technician7.user = technician_julio
services_technician7.save!

services_technician8 = ServicesTechnician.new(price: rand(5..10))
services_technician8.service = service8
services_technician8.user = technician_javier
services_technician8.save!

services_technician9 = ServicesTechnician.new(price: rand(5..10))
services_technician9.service = service4
services_technician9.user = technician_camila
services_technician9.save!

# Orders
order = Order.new(
  start: DateTime.now - 1.hour,
  end: DateTime.now,
  status: "completed",
  amount_cents: services_technician1.price_cents
)
order.user = User.where(role: "customer", email: "edu@lewagon.com").first
order.services_technician = services_technician1
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
  end: DateTime.now,
  status: "completed",
  amount_cents: services_technician2.price_cents
)
order.user = User.where(role: "customer", email: "fer@lewagon.com").first
order.services_technician = services_technician2
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
  end: DateTime.now,
  status: "completed",
  amount_cents: services_technician3.price_cents
)
order.user = User.where(role: "customer", email: "manu@lewagon.com").first
order.services_technician = services_technician3
order.save!

order = Order.new(
  start: DateTime.now - 1.hour,
  end: DateTime.now,
  status: "completed",
  amount_cents: services_technician4.price_cents
)
order.user = User.where(role: "customer", email: "julio@lewagon.com").first
order.services_technician = services_technician4
order.save!
