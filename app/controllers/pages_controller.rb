class PagesController < ApplicationController
  def index
    @page = Rhinoart::Page.find_by_path('index')
    @articles = Rhinoart::Page.where(ptype: 'article', parent_id: @page.try(:id)).order(:position)
  end
end
