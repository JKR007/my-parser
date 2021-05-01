class ParserController < ApplicationController
  def index
  end

  def parse
    ParserJob.perform_later(params['link_id'])
    redirect_to link_path(params['link_id'])
  end
end
