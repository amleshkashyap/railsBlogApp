namespace :add_feed do
  task :initialize_empty_feeds => :environment do
    articles = Article.where(created_at: (Time.now.midnight - 7.days)..(Time.now.midnight))
    articles.each do |a|
      feed = Feed.new(title: a.title, link: "articles/" << a.id, published_at: a.created_at)
      feed.save
    end
  end

  task :add_one_feed, [:title, :link, :published_at] => :environment do
    feed = Feed.new(title: title, link: link, published_at: published_at)
    feed.save
  end
end
