class HomepageController < ApplicationController
  def index
    @websites = Website.all
  end
end
