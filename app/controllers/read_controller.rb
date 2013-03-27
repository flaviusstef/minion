require 'open-uri'
require 'nokogiri'


class ReadController < ApplicationController
  def books
    @books = [1, 2, 3]
    $DEVELOPER_KEY = 'A1iuae5nneHU5s8JT6AZ0w'
    $FLAVIUS_USER_ID = 10669779

    current_time = Time.new

    url = "http://www.goodreads.com/review/list/10669779.xml?key=#{$DEVELOPER_KEY}&v=2&shelf=read&per_page=200"
    content = open(url) { |f| f.read }

    doc = Nokogiri::XML(content)

    #doc.css("user_shelf").each { |n| print "a " + n.css("name").first + "\n" }
    @books = doc.xpath("//review/book")
  end
end
