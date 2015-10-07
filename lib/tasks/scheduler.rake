desc "Populate blog posts"
task :update_posts => :environment do
  puts "Updating posts..."
  Blog.all.map(&:create_posts)
  puts "done."
end

