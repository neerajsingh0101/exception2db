class Exception2db::MainController < ApplicationController

  unloadable

  layout 'exception2db'

  before_filter :ensure_is_allowed_to_view

  def index
    @exception2dbs = Exception2db.paginate(:page => params[:page], :order => 'created_at desc')
    respond_to do |format|
      format.html
    end
  end

  def show
    @record = Exception2db.find(params[:id])
    @doc = REXML::Document.new(@record.exception)
    @cgi_data = {}
    REXML::XPath.each(@doc, '//notice/request/cgi-data/var') do |elem|
      @cgi_data.store(elem.attributes['key'].to_s, elem.text)
    end

    @agent = REXML::XPath.first(@doc, '//notice/request/cgi-data/var[@key="HTTP_USER_AGENT"]').text

    sum = []
    elem = REXML::XPath.each(@doc, '//notice/request/params/var') do |elem|
      item = ':' + elem.attributes['key'].to_s
      item << ' => '
      item << elem.text
      sum << item
    end
    @parameters = '{ ' + sum.join(' , ') + ' }'

    respond_to do |format|
      format.html
    end
  end

  private

  def ensure_is_allowed_to_view
    return true if Rails.env.development?
    unless Exception2dbConfig.setting[:is_allowed_to_view].call(self)
      render :text => '<h2>not authorized</h2>', :status => :unauthorized
    end
  end

end
