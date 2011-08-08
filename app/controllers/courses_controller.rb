class CoursesController < ApplicationController
  # GET /courses
  def index
    @courses = Course.all
    
    if cookies[:course]
      course = Course.find_by_name(cookies[:course])
      redirect_to courses_url(:name => course.name.parameterize, :id => course.id) if course
    end
  end

  # GET /courses/1
  def show
    @course = Course.find(params[:id])
    cookies.permanent[:course] = @course.name

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def main
    clear_course
    redirect_to root_url
  end
  
  def action
    if cookies[:novels].blank?
      novel = {
        params[:name].to_s => {
          :page => params[:page].to_s,
          :read => params[:read]
        }
      }
      cookies.permanent[:novels] = JSON.generate(novel)
    else
      novel = {
        params[:name].to_s => {
          :page => params[:page].to_s,
          :read => params[:read]
        }
      }
      
      cookies.permanent[:novels] = JSON.generate(JSON.parse(cookies[:novels]).merge!(novel))
    end
    
    @read = params[:read]
    @name = params[:name]
    
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
end
