class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      redirect_to root_path
    else
      flash[:notice] = "Invalid request"
      render root_path
    end
  end

  private

  def blog_params
    params.require('blog').permit(:author, :url)
  end
end
