class FeedsController < ApplicationController

  skip_before_action :authorized

  def index
    @articles = Feed.all
  end
end
