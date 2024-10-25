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
    u.role = User.roles[:admin]
    u.password = "password"
    u.password_confirmation = "password"
end

foobar = User.create do |u|
    u.email = "foo@bar.com"
    u.name = "Mr Foobar"
    u.password = "password"
    u.password_confirmation = "password"
    # default role User
end

3.times do |x|
    post = Post.create do |p|
        p.title = "Blog Post #{x}"
        p.body = "Quem pastores lauda vere!"
        p.user = sam
    end

    4.times do |y|
        Comment.create do |c|
            c.body = "I like this Post #{y}",
            c.post = post,
            c.user = foobar
        end
    end
end

Post.create do |p|
    p.title = "Blog Post 9000"
    p.body = "I am Mr Foobar and this is my first Post"
    p.user = foobar
end