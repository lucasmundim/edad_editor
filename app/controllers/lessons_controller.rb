class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end
  
  def new
    @lesson = Lesson.new
  end
  
  def create
    @lesson = Lesson.new(params[:lesson])
    
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to(lessons_path, :notice => 'Aula cadastrada com sucesso') }
        format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end
end
