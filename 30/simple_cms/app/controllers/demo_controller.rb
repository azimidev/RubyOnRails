class DemoController < ApplicationController

  layout false

  def index
    render('hello')
  end

  def hello
    render('index')
  end

end
