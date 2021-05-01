require 'mechanize'

class ParserJob < ApplicationJob
  queue_as :default

  def perform(link_id)
    @link = Link.find(link_id)

    file_name = @link.website.file_name
    service_class = ('ParserWebsites::' + file_name.camelize).constantize

    service_object = service_class.new({link: @link})
    service_object.run
  end
end
