# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customer_1 = Customer.create(first: "Johny", last: "Flow", email: "jflow@gmail.com", address: "123 Fake St")
customer_2 = Customer.create(first: "Raj", last: "Jamnis", email: "rjamnis@gmail.com", address: "321 Not Real St")

subscription_1 = Subscription.create(title: "Earl Grey", price: "10.00", status: 1, frequency: "monthly", customer_id: customer_1.id)
subscription_2 = Subscription.create(title: "Green Tea", price: "4.00", status: 2, frequency: "monthly", customer_id: customer_1.id)
subscription_3 = Subscription.create(title: "Black Tea", price: "7.00", status: 1, frequency: "monthly", customer_id: customer_2.id)
subscription_4 = Subscription.create(title: "Green Tea", price: "3.00", status: 2, frequency: "monthly", customer_id: customer_2.id)