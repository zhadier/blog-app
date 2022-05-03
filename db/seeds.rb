# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is the fourth post')

Comment.create(post: first_post, author: second_user, text: 'Hi Lisandro!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Sahar!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Andres!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Nicolas!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Reem!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Other Stalkers!' )

Like.create(post: Post.first, author:User.first)
Like.create(post: Post.second, author:User.first)
Like.create(post: Post.third, author:User.second)
Like.create(post: Post.fourth, author:User.first)