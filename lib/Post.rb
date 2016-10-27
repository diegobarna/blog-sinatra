class Post
  attr_reader :title, :content, :author, :category, :date

  def initialize(title, content, author, category, date)
    @title = title
    @content = content
    @author = author
    @category = category
    @date = date.strftime("%F")
  end
end