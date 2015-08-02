class DemoController < ApplicationController

  layout 'application'

  def index
  end

  def hello
    # render('index')
    @array = [1,2,3,4,5]
    @id = params['id'].to_i
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def parsclick
    redirect_to("http://parsclick.net")
  end

  def text_helpers
  end

  def escape_output
  end

end
