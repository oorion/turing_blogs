turing_blogs = [
  ['Orion Osborn', 'oorion.net/rss'],
  ['Dmitry Vizersky', 'http://dmitryvizer.com/?feed=rss2'],
  ['Mike Dao', 'http://ploos.io/rss'],
]

turing_blogs.each do |author, rss_url|
  Blog.create(author: author, rss_url: rss_url)
end

