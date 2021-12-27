#frozen_string_literal: true

MSG_NOT_ACCEPTABLE = '406: Not Acceptable: This page is only available in XML format'

#book stuff controller
class BookController < ApplicationController
  def input; end

  def malformed
    respond_to do |format|
      format.html { render html: 'Malformed request!', status: 500 }
    end
  end

  def data
    respond_to do |format|
      format.xml { render xml: Book.all.map(&:serializable_hash) }
    end
  end

  def output
    @name = params['number'].to_i || 1
    if ( cached = Book.find_by(name: @name))
      @rows = cached.to_json        
    else 
      Book.create name: @name, author: @author, icbn: @icbn, publishing_house: @publishing_house, year: @year
      @rows = Book.find_by(name: @name).to_json
    end
  end
end
