require 'book_repository'

class ReadController < ApplicationController
  def books
    br = BookRepository.new
    @books = br.all
    @total_pages = br.total_pages
  end
end
