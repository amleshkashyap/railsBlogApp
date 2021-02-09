module Visible
  # this module simplifies the status validations in the concerns
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  # validate the status field for each model which includes the module "Visible"
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # concerns also allow having class methods which can be directly used in the view (check the articles/index.html.erb)
  # this method counts all the comments/articles (or any model which includes "Visible") with status = public
  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  # this method is used in the views to avoid displaying comments/articles which have status = archived
  def archived?
    status == 'archived'
  end
end
