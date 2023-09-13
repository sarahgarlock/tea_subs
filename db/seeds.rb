# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_1 = Customer.create(first: "Johny", last: "Flow", email: "jflow@gmail.com", address: "123 Fake St")

subscription_1 = Subscription.create(title: "Earl Grey", price: "10.00", status: 0, frequency: "monthly", customer_id: customer_1.id)