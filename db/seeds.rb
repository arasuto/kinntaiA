# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
    
             
             
60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

user = User.create(name: "User Name")
user.articles.build(title: "My article")
user.save

ActiveRecord::Schema.define(version: 2019_06_09_055553) do
  create_table "users", force: :cascade do |t|
    t.string "name"
  end
  create_table "articles", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
  end
end