class HomeController < ApplicationController

  # GET /posts
  def index
    @posts = Post.limit(5)
  end
end
