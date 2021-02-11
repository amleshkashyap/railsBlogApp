class FeedInjectorWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :high
  sidekiq_options :retry => true

  def perform(title, link, published_at)
    @feed = Feed.create(title: title, link: link, published_at: published_at)
  end
end
