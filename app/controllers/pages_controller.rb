class PagesController < ApplicationController
  def index
    @page = Rhinoart::Page.find_by_path('index')
  end

  def internal
    @page = Rhinoart::Page.find_by_path(params[:url])
  end
end
