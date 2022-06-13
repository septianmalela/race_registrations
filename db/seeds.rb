# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'maulanas430@gmail.com', password: '123123', password_confirmation: '123123')
User.first.build_contest.save

type_pmrs     = ListContest::type_pmrs
type_contests = ListContest::type_contests
title_names   = ListContest.title_names

type_pmrs.each do |key_type_pmr, value_type_pmr|
  type_contests.each do |key_type_contest, value_type_contest|
    title      = title_names[key_type_contest.to_sym]
    name_title = "#{title} #{key_type_pmr}".upcase
    ListContest.create(title: name_title, type_pmr: value_type_pmr, type_contest: value_type_contest) rescue nil
  end
end

FirstAid.all.each do |first_aid|
  Inventory.create(stock: 20, price: 10000, inventoryable: first_aid)
end

first_aid_1 = FirstAid.first
first_aid_2 = FirstAid.second

contest = User.first.contest
contest.member_contests.create(school: 'SMK Negeri 13 Bandung', code: 'ppw-001',
                               helper_1: 'septian', helper_2: 'maulana', list_contest: first_aid_1)

contest.member_contests.create(school: 'SMK Negeri 13 Bandung', code: 'ppw-002',
                               helper_1: 'fiky', helper_2: 'ramadhani', list_contest: first_aid_2)