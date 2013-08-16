require 'open-uri'
require 'nokogiri'

class BookRepository
  def read_xml_from_server
    $DEVELOPER_KEY = 'A1iuae5nneHU5s8JT6AZ0w'
    $FLAVIUS_USER_ID = 10669779

    current_time = Time.new

    url = "http://www.goodreads.com/review/list/10669779.xml?key=#{$DEVELOPER_KEY}&v=2&shelf=to-read&per_page=200"
    content = open(url) { |f| f.read }

    doc = Nokogiri::XML(content)
    File.open('flav','w') do |f|
      f.write(content)
    end
    doc
  end

  def read_xml_from_file
    Nokogiri::XML(File.read('flav'))
  end

  def xml
    #read_xml_from_server
    read_xml_from_file
  end

  def all
    @books = xml.xpath("//review/book")
  end

  def total_pages
    @books.reduce(0) { |sum, book| sum + ((book.css("num_pages").first.content != "") ? Integer(book.css("num_pages").first.content) : 0) }
  end
end
