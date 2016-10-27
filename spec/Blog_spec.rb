require './server.rb'
require 'rspec'
require 'rack/test'

describe Post do
  before(:each) do
    @post = Post.new("Test", "Test post", "Diego C.", "Deveoplment", Date.today)
  end

  describe "#title" do
    it "has title" do
      expect(@post.title).to_not be_empty
    end
  end

  describe "#content" do
    it "has content" do
      expect(@post.content).to_not be_empty
    end
  end

  describe "#date" do
    it "has date" do
      expect(@post.date).to_not be_nil
    end
  end

  describe "#author" do
    it "has author" do
      expect(@post.author).to_not be_empty
    end
  end

  describe "#category" do
    it "has category" do
      expect(@post.category).to_not be_empty
    end
  end
end

describe Blog do
  before(:each) do
    @blog = Blog.new
    @post = Post.new("Test 1", "Test post 1", "Diego C.", "Development", Date.today.prev_day)
    @post2 = Post.new("Test 2", "Test post 2", "Diego C.", "Development", Date.today)
    @post3 = Post.new("Test 3", "Test post 3", "Diego C.", "Other", Date.today.next_day)
    @blog.add_post(@post)
    @blog.add_post(@post2)
    @blog.add_post(@post3)
  end

  describe "#posts" do
    it "it returns an array" do
      expect(@blog.posts.class).to be Array
    end
  end

  describe "#latest_posts" do
    it "returns posts by date, newset first" do
      expect(@blog.latest_posts.first.date).to be > @blog.latest_posts.last.date
    end
  end

  describe "#pages" do
    it "it returns an array" do
      expect(@blog.pages.class).to be Array
    end
  end
end
