require 'mechanize'
require 'awesome_print'

# ParserWebsites::Avtoelon.new({link: Link.find(1)}).run
module ParserWebsites
  class Avtoelon
    def initialize(params)
      @link = params[:link]
      @parser = @link.parsers.create
      @base_url = @link.website.url
      @agent = Mechanize.new
    end

    def run
      page = @agent.get(@link.url)
      parse_records_list(page)
    end

    private

    def parse_records_list(page)
      page.search('.a-el-info-title a').each do |anchor_tag|
        record_url = @base_url + anchor_tag.attributes['href'].value

        @agent.get(record_url) do |record_page|
          parse_record(record_page)
        end
      end
    end

    def parse_record(page)
      record = Record.new

      record.url = page.uri.to_s
      record.name = page.search('.a-title__text').text.squish
      record.descrtiption = page.search('.a-params').text.squish
      record.link_id = @link.id
      record.parser_id = @parser.id

      save_record(record)
    end

    def save_record(record)
      ap record if record.save!
    end
  end
end