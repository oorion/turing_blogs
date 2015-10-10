turing_blogs = [
  ['Orion Osborn', 'oorion.net/rss'],
  ['Dmitry Vizersky', 'http://dmitryvizer.com/?feed=rss2'],
  ['Mike Dao', 'http://ploos.io/rss'],
  ['Alex Jensen', 'dalexj.github.io/feed.xml'],
  ['Josh Cass', 'http://joshcass.com/feed'],
  ['Drew Reynolds', 'http://blog.drewreynolds.me/rss'],
  ['Marla Brizel', 'http://marlabrizel.github.io/feed.xml'],
  ['George Hudson', 'http://turingwithgeorge.tumblr.com/rss'],
  ['Sebastian Abondano', 'http://sebastianabondano.tumblr.com/rss'],
  ['Kate Lane', 'http://k8lane.tumblr.com/rss'],
  ['Chris Luhring', 'http://cluhring.github.io/rss/index.rss'],
  ['Tom Leskin', 'http://tleskin.github.io/feed.xml'],
  ['Samson Brock', 'http://badmotivator.io/feed.xml']
]

turing_blogs.each do |author, rss_url|
  Blog.create(author: author, rss_url: rss_url)
end
