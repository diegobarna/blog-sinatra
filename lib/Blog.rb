class Blog
  attr_accessor :posts, :pages

  def initialize
    @posts = []
    @pages = []
  end

  def add_post(post)
    @posts << post
  end

  def latest_posts
    unless @posts.nil?
      sorted = @posts.sort{ |a, b| b.date <=> a.date }
      return sorted
    end
    @posts
  end

  def create_pages(per_page)
    newest_posts = @posts.latest_posts
    num_of_pages = (newest_posts.size / per_page.to_f).ceil
    num_of_pages.times do
      @pages << newest_posts.shift(num_of_pages)
    end
    num_of_pages
  end
end
