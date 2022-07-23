# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@gmail.com', password: 'admin123', password_confirmation: 'admin123')

# User.create(email: 'maulanas430@gmail.com', password: '123123', password_confirmation: '123123')
# Contest.create(user: User.first)

# type_pmrs     = ListContest::type_pmrs
# type_contests = ListContest::type_contests
# title_names   = ListContest.title_names

# type_pmrs.each do |key_type_pmr, value_type_pmr|
#   type_contests.each do |key_type_contest, value_type_contest|
#     title      = title_names[key_type_contest.to_sym]
#     name_title = "#{title} #{key_type_pmr}".upcase
#     ListContest.create(title: name_title, type_pmr: value_type_pmr, type_contest: value_type_contest) rescue nil
#   end
# end

# ListContest.all.each do |list_contest|
#   Inventory.create(stock: 20, price: 10000, inventoryable: list_contest)
# end

# first_aid_1 = FirstAid.first
# first_aid_2 = FirstAid.second

# first_aid_1.update(value_format: {'pembalutan_luka' => 10})

# contest = User.first.contest
# contest.member_contests.create(school: 'SMK Negeri 13 Bandung', code: 'ppm-001',
#                                helper_1: 'septian', helper_2: 'maulana', list_contest: first_aid_1)

# contest.member_contests.create(school: 'SMK Negeri 13 Bandung', code: 'ppw-002',
#                                helper_1: 'fiky', helper_2: 'ramadhani', list_contest: first_aid_2)

# user = User.first
# list_contest = ListContest.find(9)

# (0..100).each do |num|
#   MemberContest.new(school: user.profile.school, helper_1: "septian_#{num}", helper_2: "yusup_#{num}", contest: user.contest, list_contest: list_contest).save
# end

# User.destroy_all
# Payment.destroy_all
# MemberContest.destroy_all
