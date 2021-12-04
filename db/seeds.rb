# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
Category.new(name: "Laptop", icon: "fas fa-laptop").save
Category.new(name: "Smartphone", icon: "fas fa-laptop").save
Category.new(name: "Printer", icon: "fas fa-print").save
Category.new(name: "Smart TV", icon: "fas fa-tv").save
