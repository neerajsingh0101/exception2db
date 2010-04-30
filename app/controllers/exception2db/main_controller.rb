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
