# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
gaby = User.create(email: 'gabysuriano165@gmail.com', password: 'hola123')
aileen = User.create(email: 'aileen@gmail.com', password: 'test123')

# TODOLISTS
currently_planning = Todolist.create(name: 'Currently Planning', description: 'Trips I\'m currently planning', user: gaby)
to_start = Todolist.create(name: 'To Start', description: 'Trips I want to start planning', user: gaby)
waiting_for = Todolist.create(name: 'Waiting', description: 'Trips on hold', user: gaby)

# CATEGORIES
outdoor = Category.create(name: "Outdoor")
culture = Category.create(name: "Culture")
family = Category.create(name: "Family")
party = Category.create(name: "Party")
food = Category.create(name: "Food")
sightseeing = Category.create(name: "Sightseeing")

# COUNTRIES
germany = Country.create(name: "Germany")
usa = Country.create(name: "USA")
egypt = Country.create(name: "China")
australia = Country.create(name: "Australia")
salvador = Country.create(name: "El Salvador")

# TRIPS
zugspitze = Trip.create( title: 'Zugspitze',
                      description: 'tallest peak in Germany ~3000m',
                      day: 'Fri',
                      time: '8:00 AM',
                      season: 'summer' )
zugspitze.categories << outdoor
zugspitze.country = germany
zugspitze.save

lago_coatepeque = Trip.create( title: 'Lago Coatepeque',
                      description: 'Most beautiful lake in El Salvador',
                      season: 'anytime' )
lago_coatepeque.categories << outdoor
lago_coatepeque.country = salvador
lago_coatepeque.save

pyramids = Trip.create( title: 'Pyramids',
                      description: 'Ancient pyramids in Egypt',
                      season: 'winter' )
pyramids.categories << outdoor
pyramids.categories << culture
pyramids.country = egypt
pyramids.save

vegas = Trip.create( title: 'Viva las Vegas',
                      description: 'partying ofc',
                      season: 'summer' )
vegas.categories << party
vegas.categories << sightseeing
vegas.country = usa
vegas.save

# Listing
listing1 = Listing.create(todolist: currently_planning, trip: vegas, user: gaby, user_status: 'Currently Planning', user_season: 'summer')
listing2 = Listing.create(todolist: to_start, trip: zugspitze, user: gaby, user_status: "Not Started", user_season: 'summer')
listing3 = Listing.create(todolist: waiting_for, trip: lago_coatepeque, user: gaby, user_status: "on Hold", user_season: 'summer', fav: true)
listing4 = Listing.create(todolist: currently_planning, trip: pyramids, user: gaby, user_status: "Currently Watching", user_season: 'summer', fav: true)
