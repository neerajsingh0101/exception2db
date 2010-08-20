class Exception2db::MainController < ApplicationController

  unloadable

  layout 'exception2db'

  before_filter :ensure_is_allowed_to_view

  def index
    @exception2dbs = E2db.paginate(:page => params[:page], :order => 'created_at desc')
    respond_to do |format|
      format.html
    end
  end

  def show
    @record = E2db.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  private

  def ensure_is_allowed_to_view
    # not using Rails.env.development? because cucumber test was failing with Rails.env
    # but worked with RAILS_ENV. need to investigate further. TODO
    return true if RAILS_ENV == 'production'
    unless Exception2dbConfig.setting[:is_allowed_to_view].call(self)
      render :text => '<h2>Not Authorized</h2>', :status => :unauthorized
    end
  end

end
