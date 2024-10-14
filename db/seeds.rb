# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sam = User.create do |u|
    u.email = "sam@example.com"
    u.name = "Sam Schams"
    u.password = "password"
    u.password_confirmation = "password"
end

foobar = User.create do |u|
    u.email = "foo@bar.com"
    u.name = "Mr Foobar"
    u.password = "password"
    u.password_confirmation = "password"
end

Post.create do |p|
    p.title = "Blog Post 9000"
    p.body = "I am Mr Foobar and this is my first Post"
    p.user_id = foobar.id
end

3.times do |x|
    Post.create(title: "Title #{x}", body: "Body #{x} words go here idk", user_id: sam.id)
end