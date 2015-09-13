class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @posts = Post.order(published_on: :desc)
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      flash[:notice] = "Added #{blog.rss_url}"
      redirect_to root_path
    else
      flash[:notice] = "Invalid request"
      render root_path
    end
  end

  private

  def blog_params
    params.require('blog').permit(:author, :rss_url)
  end
end
