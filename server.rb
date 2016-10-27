require 'sinatra'
require 'sinatra/reloader'
require './lib/Blog'
require './lib/Post'
require 'pry'

blog = Blog.new
post = Post.new("Test 1", "Test post 1", "Diego C.", "Deveoplment", Date.today.prev_day(3))
post2 = Post.new("Test 2", "Test post 2", "Diego C.", "Art", Date.today.prev_day(2))
post3 = Post.new("Test 3", "Test post 3", "Diego C.", "Science", Date.today.prev_day)
blog.add_post(post)
blog.add_post(post2)
blog.add_post(post3)

get '/' do
  if blog.posts
    @posts = blog.latest_posts
    erb :home
  else
    redirect to '/add_post'
  end
end

get '/post/:index' do
  @post = blog.latest_posts[params[:index].to_i]
  erb :post
end

get '/add_post' do
  erb :add_post
end

post '/new_post' do
  new_post = Post.new(params[:title], params[:content], params[:author], params[:category], Time.now)
  blog.add_post(new_post)
  redirect to '/'
end