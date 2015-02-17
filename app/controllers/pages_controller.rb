class PagesController < ApplicationController
  def index
    @page = Rhinoart::Page.find_by_path('index')
    @articles = Rhinoart::Page.where(ptype: 'article', parent_id: @page.id).order(:position)
  end

  def internal
    @page = Rhinoart::Page.find_by_path(params[:url])
  end
end
