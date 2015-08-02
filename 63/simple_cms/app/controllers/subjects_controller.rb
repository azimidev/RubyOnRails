class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
