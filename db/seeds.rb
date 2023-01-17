# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'tom20223858@gmail.com', password: 'tom123456')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', email: 'lilly20223858@gmail.com', password: 'lilly123456')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Amazing App', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Fantastic', text: 'This is my third post')
forth_post = Post.create(author: second_user, title: 'Hello', text: 'This is my first post')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: second_user, text: 'Amazing Tom!')
Comment.create(post: third_post, author: second_user, text: 'Brilliant Tom!')
Comment.create(post: forth_post, author: first_user, text: 'Brilliant Lilly!')
Comment.create(post: first_post, author: first_user, text: 'Thanks Lilly!' )
Comment.create(post: second_post, author: first_user, text: 'Thanks Lilly!' )



