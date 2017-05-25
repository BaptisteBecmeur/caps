class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @services = Service.order('created_at DESC').limit(6)
  end
end
