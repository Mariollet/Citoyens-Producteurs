# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


################# DATABASE DESTROY ##########################

ProductAppointment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('ProductAppointment')
Comment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
Appointment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('appointments')
ProductEvent.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('product_events')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') 
StoreProduct.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('store_products')
Store.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('stores')
Address.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('addresses')
EventType.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('event_types')
Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
Unit.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('units')
Blog.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('blogs')
Like.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('like')
BlogComment.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('blog_comment')

################# DATABASE DESTROY ##########################
require 'faker'
require 'time'

t1 = Time.parse("2020-03-01 00:00:00")
t2 = Time.parse("2020-05-01 00:00:00")
########### Unit ###########
array_unit = ["kg", "L", "unités","pots","bottes"]
arrayunitlength = array_unit.length

(0..arrayunitlength).each do |i|
  unit = Unit.new(
  name: array_unit[i]
  )
  unit.save
  puts "Unit n°#{i + 1} done"
end

########### PRODUCT #################

(0..5).each do |i|
  product = Product.new(
  name:Faker::Food.fruits,
  )
  product.save
  
  product = Product.new(
    name:Faker::Food.vegetables,
    )
  product.save

  product = Product.new(
    name:Faker::Food.ingredient,
    )
  product.save
  puts "Prdouct n°#{i + 1} done"
end

########### ADDRESS #################

(0..25).each do |i|

  address = Address.new(
    place:Faker::Address.street_name,
    zip_code: "92340",
    city: "Bourg-la-Reine",
    sector: ["Peyrou","Comedie","Gare","Préfecture","Centre"].sample, 
  )
  address.save
  puts "Address seed n° #{i + 1}"
end

########### EVENT_TYPE #################

event_type_array = ["Récolte","Partage","Cuisine"]

(0..3).each do |i|

  event_type = EventType.new(
    name: event_type_array[i],
  )
  event_type.save

  puts "Event_type seed n° #{i + 1}"
end

########### STORE #################

(0..3).each do |i|
  store = Store.new(
    name: Faker::Company.name,
    address_id:rand(1..20),
  )
  store.save
  puts "Store seed n° #{i + 1}"
end

########### USER #################

user = User.new(
  first_name: "Anthony", 
  last_name: "Phim", 
  email: "anthony.phim@gmail.com", 
  password: "azerty34",
  address_id:rand(1..20),
  store_id: "2",
  phone_number:Faker::PhoneNumber.phone_number,
  is_admin: true,
  has_payed: true,
)
user.save
puts "Anthony done"
user = User.new(
  first_name: "Leo", 
  last_name: "Vanel", 
  email: "leovanel@hotmail.com", 
  password: "azerty34",
  address_id:rand(1..20),
  store_id:"2",
  phone_number:Faker::PhoneNumber.phone_number,
  is_admin: true,
  has_payed: true,
)
user.save
puts "Leo done"
user = User.new(
  first_name: "Augustin", 
  last_name: "De Louvencourt", 
  email: "mail23@yopmail.com", 
  password: "azerty34",
  address_id:rand(1..20),
  store_id:"2",
  phone_number:Faker::PhoneNumber.phone_number,
  is_admin: true,
  has_payed: true,
)
user.save
puts "Augustin done"
user = User.new(
  first_name: "Thibault", 
  last_name: "Mariolle", 
  email: "Thib@yopmail.com", 
  password: "azerty34",
  address_id:rand(1..20),
  store_id:"2",
  phone_number:Faker::PhoneNumber.phone_number,
  is_admin: true,
  has_payed: true,
)
user.save
puts "Thib done"
user = User.new(
  first_name: "Lana", 
  last_name: "Vizoli", 
  email: "Lana@yopmail.com", 
  password: "azerty34",
  address_id:rand(1..20),
  store_id:"2",
  phone_number:Faker::PhoneNumber.phone_number,
  is_admin: true,
  has_payed: true,
)
user.save
puts "Lana done"

(0..20).each do |i|
  username = Faker::GreekPhilosophers.name
  lastnameuser = Faker::Creature::Cat.name

  user = User.new(
    first_name: username, 
    last_name: lastnameuser, 
    email:"#{username}.#{lastnameuser}@yopmail.com", 
    password:"azerty34",
    address_id:rand(1..20),
    store_id: rand(1..3),
    avatar: "avatar_#{rand(1..5)}",
    phone_number:Faker::PhoneNumber.phone_number,
  )

  user.save
  puts "User seed n°#{i + 1}" 
end

########### STORE_PRODUCT #################

(1..100).each do |i|
  storeproduct = StoreProduct.new(
    product_id:rand(0..30),
    store_id:rand(0..1),
    quantity:rand(2..99),
    unit_id: rand(0..arrayunitlength),
  )
  storeproduct.save
  puts "Store_product seed n° #{i}"
end 
########### EVENT #################

  (1..40).each do |i|
  startdate = rand(t1..t2)

  event = Event.new(
  title: Faker::Restaurant.name,
  description: Faker::Restaurant.description,
  start_date: startdate, 
  end_date: startdate + rand(20000..30000),
  address_id: rand(1..20), 
  creator_id: rand(1..20), 
  event_type_id:rand(1..3),
  )
  event.save

  puts "Event seed n° #{i}"
end

########### COMMENT #################

(1..100).each do |i|
  comment = Comment.new(
    text:Faker::Hacker.say_something_smart,
    user_id:rand(1..20),
    event_id:rand(1..25),
  )
  comment.save
  puts "Comment seed n° #{i}"
end

########### APPOINTMENT #################

timenow = Time.now
startdate = rand(timenow..t2)
(1..60).each do |i|
  appointment = Appointment.new(
  user_id:rand(1..20),
  event_id:rand(1..25),
  start_date: startdate,
  duration:rand(30..300)*5,
  status: "Future appointment",
  points:rand(5..100))
  appointment.save

puts "Appointment seed n°#{i}"
end

########### PRODUCT_EVENT #################

(1..50).each do |i|
  productevent = ProductEvent.new(
    product_id:i,
    event_id:i,
    unit_id: rand(1..arrayunitlength),  
    quantity: rand(1..99),
  )
  productevent.save
  
puts "Product Event seed n°#{i}"
end


########### PRODUCT_APPOINTMENT #################

(1..50).each do |i|
  productappointment = ProductAppointment.new(
    product_id: rand(1..30),
    appointment_id:rand(1..25),
    quantity: rand(1..99),
    unit_id: rand(1..arrayunitlength),
  )
  productappointment.save
  puts "Product_appointment seed n°#{i}"
end

########### BLOG #################

(1..30).each do |i|

  blog = Blog.new(
  title: Faker::Restaurant.name,
  content: Faker::Restaurant.description * 6,
  user_id: rand(1..20), 
  )
  blog.save

  puts "Blog seed n° #{i + 1}"
end

########### BLOG_COMMENT #################

(1..80).each do |i|
  comment = BlogComment.new(
    text: Faker::Hacker.say_something_smart,
    user_id:rand(1..20),
    blog_id:rand(1..30),
  )
  comment.save
  puts "Blog Comment seed n° #{i}"
end

########### BLOG_LIKE #################

(1..111).each do |i|
  like = Like.new(
    user_id:rand(1..20),
    blog_id:rand(1..30),
  )
  like.save
  puts "Blog like seed n° #{i}"
end

puts "Seed DONE, Enjoy !"