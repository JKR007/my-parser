class LinksController < ApplicationController
  before_action :set_website

  def index
    @links = @website.links
  end

  def show
    @link = Link.find(params[:id])
    @parser = @link.parsers.last
  end

  private

  def set_website
    @website = Website.find(params[:website_id]) if params[:website_id]
  end
end
