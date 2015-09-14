class Post < ActiveRecord::Base
  belongs_to :blog

  validates :title, uniqueness: true
  validates :url, uniqueness: true
end
