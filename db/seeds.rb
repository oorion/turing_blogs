turing_blogs = [
  ['Orion Osborn', 'oorion.net/rss'],
  ['Dmitry Vizersky', 'http://dmitryvizer.com/?feed=rss2'],
  ['Mike Dao', 'http://ploos.io/rss'],
  ['Alex Jensen', 'dalexj.github.io/feed.xml'],
  ['Josh Cass', 'http://joshcass.com/feed'],
]

turing_blogs.each do |author, rss_url|
  Blog.create(author: author, rss_url: rss_url)
end

