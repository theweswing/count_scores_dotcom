# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'activerecord-reset-pk-sequence'
require 'bcrypt'

print('Seeding!')
#USERS

# wes = User.find(1)
# yuyi = User.find(2)
# tenzin = User.find(3)
# liam = User.find(4)
# john = User.find(5)
# vanessa = User.find(6)
# erwan = User.find(7)
# margo = User.find(8)
# ivan = User.find(9)
# cj = User.find(10)

wes =
  User.create(
    username: 'theweswing',
    password_digest: BCrypt::Password.create('sexywes'),
    email: 'wschierenbeck@gmail.com',
    first_name: 'Wes',
    last_name: 'Schierenbeck',
  )
yuyi =
  User.create(
    username: 'yuyi',
    password_digest: BCrypt::Password.create('sexyyuyi'),
    email: 'yuyi365@gmail.com',
    first_name: 'Yuyi',
    last_name: 'Li',
  )

tenzin =
  User.create(
    username: 'illuminati_tibet',
    password_digest: BCrypt::Password.create('sexytenzin'),
    email: 'tenzin.tashi837@gmail.com',
    first_name: 'Tenzin',
    last_name: 'Tashi',
  )

liam =
  User.create(
    username: 'Liami_Heat',
    password_digest: BCrypt::Password.create('sexyliam'),
    email: 'liam.h.obrien@gmail.com',
    first_name: 'Liam',
    last_name: "O'Brien",
  )
john =
  User.create(
    username: 'tall_cop_john',
    password_digest: BCrypt::Password.create('sexyjohn'),
    email: 'john.simon@gmail.com',
    first_name: 'John',
    last_name: 'Simon',
  )
vanessa =
  User.create(
    username: 'hobbit_vanessa',
    password_digest: BCrypt::Password.create('sexyvanessa'),
    email: 'vanessaventola@gmail.com',
    first_name: 'Vanessa',
    last_name: 'Ventola',
  )
erwan =
  User.create(
    username: 'french_erwan',
    password_digest: BCrypt::Password.create('sexyerwan'),
    email: 'erwan.lecun@gmail.com',
    first_name: 'Erwan',
    last_name: 'LeCun',
  )
margo =
  User.create(
    username: 'kitty_margo',
    password_digest: BCrypt::Password.create('sexymargo'),
    email: 'margo.sun@gmail.com',
    first_name: 'Margo',
    last_name: 'Sun',
  )
ivan =
  User.create(
    username: 'Vanya',
    password_digest: BCrypt::Password.create('sexyivan'),
    email: 'ivan.kelber@gmail.com',
    first_name: 'Ivan',
    last_name: 'Kelber',
  )
cj =
  User.create(
    username: 'tall_cop_cj',
    password_digest: BCrypt::Password.create('sexycj'),
    email: 'cj_snyder@gmail.com',
    first_name: 'CJ',
    last_name: 'Snyder',
  )

#GAMES
g1 = Game.create(name: 'Settlers of Catan')
g2 = Game.create(name: 'Elkfest')
g3 = Game.create(name: 'Shuffleboard')
g4 = Game.create(name: 'The Resistance: Avalon')
g5 = Game.create(name: 'Basketball (1v1)')

#MATCHES

#Catan
m1 = Match.create(date: '12/25/2021')
g1.matches << m1

m2 = Match.create(date: '12/31/2021')
g1.matches << m2

m3 = Match.create(date: '07/04/2021')
g1.matches << m3

# Elfkest

m4 = Match.create(date: '10/17/1991')
g2.matches << m4

m5 = Match.create(date: '10/17/1992')
g2.matches << m5

m6 = Match.create(date: '10/17/1993')
g2.matches << m6

#Shuffleboard (are there scores?)

m7 = Match.create(date: '10/17/1994')
g3.matches << m7

m8 = Match.create(date: '10/17/1995')
g3.matches << m8

m9 = Match.create(date: '10/17/1996')
g3.matches << m9

#The Resistance: Avalon

m10 = Match.create(date: '10/17/1997')
g4.matches << m10

m11 = Match.create(date: '10/17/1998')
g4.matches << m11

m12 = Match.create(date: '10/17/1999')
g4.matches << m12

#Basketball 1v1

m13 = Match.create(date: '10/17/2000')
g5.matches << m13

m14 = Match.create(date: '10/17/2001')
g5.matches << m14

m15 = Match.create(date: '10/17/2001')
g5.matches << m15

m16 = Match.create(date: '10/17/2002')
g5.matches << m16

#PLAYERS

#Match 1: Catan
p1 =
  Player.create(score: 10, is_winner: true, match_id: m1.id, user_id: tenzin.id)
p2 = Player.create(score: 9, is_winner: false, match_id: m1.id, user_id: wes.id)
p3 =
  Player.create(score: 8, is_winner: false, match_id: m1.id, user_id: yuyi.id)
p4 =
  Player.create(score: 7, is_winner: false, match_id: m1.id, user_id: liam.id)

#Match 2: Catan

p5 =
  Player.create(score: 10, is_winner: true, match_id: m2.id, user_id: tenzin.id)
p6 = Player.create(score: 6, is_winner: false, match_id: m2.id, user_id: wes.id)
p7 = Player.create(score: 8, is_winner: false, match_id: m2.id, user_id: cj.id)
p8 =
  Player.create(score: 7, is_winner: false, match_id: m2.id, user_id: ivan.id)

#Match 3: Catan

p9 =
  Player.create(score: 8, is_winner: false, match_id: m3.id, user_id: liam.id)
p10 =
  Player.create(score: 10, is_winner: true, match_id: m3.id, user_id: wes.id)
p11 =
  Player.create(
    score: 5,
    is_winner: false,
    match_id: m3.id,
    user_id: vanessa.id,
  )
p12 =
  Player.create(score: 6, is_winner: false, match_id: m3.id, user_id: john.id)

#Match 13: Basketball

p13 =
  Player.create(score: 7, is_winner: true, match_id: m13.id, user_id: tenzin.id)
p14 =
  Player.create(score: 3, is_winner: false, match_id: m13.id, user_id: wes.id)

#Match 14: Basketball

p15 =
  Player.create(score: 6, is_winner: false, match_id: m14.id, user_id: john.id)
p16 =
  Player.create(score: 7, is_winner: true, match_id: m14.id, user_id: wes.id)

#Match 15: Basketball

p17 =
  Player.create(score: 7, is_winner: true, match_id: m15.id, user_id: liam.id)
p18 =
  Player.create(score: 6, is_winner: false, match_id: m15.id, user_id: wes.id)

print('Finished seeding!')
