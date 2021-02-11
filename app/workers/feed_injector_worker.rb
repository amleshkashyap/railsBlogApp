class FeedInjectorWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :high
  sidekiq_options :retry => true

  def perform(title, link, published_at, type)
    if type == "create"
      @feed = Feed.create(title: title, link: link, published_at: published_at)
    elsif type == "delete"
      @feed = Feed.delete_by(link: link)
    end
  end
end
