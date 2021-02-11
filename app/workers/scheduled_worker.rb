class ScheduledWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :high
  sidekiq_options :retry => true

  def perform(*args)
    time = Time.now
    @feed = Feed.destroy_by(published_at: (Time.now.midnight - 7.day)..(Time.now.midnight))
  end
end
