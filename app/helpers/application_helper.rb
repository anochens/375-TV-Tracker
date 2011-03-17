module ApplicationHelper
  def production?
      (ENV['RAILS_ENV']=='production')
  end
end
