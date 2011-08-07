class CoursesController < ApplicationController
  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end
end
