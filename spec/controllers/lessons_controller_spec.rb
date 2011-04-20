require 'spec_helper'

describe LessonsController do
  before :each do
    @lesson = mock_model(Lesson)
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should assigns all lessons" do
      lessons = [@lesson]
      Lesson.should_receive(:all).and_return(lessons)
      get :index
      assigns(:lessons).should == lessons
    end
  end
  
  describe "GET 'new'" do
    it "should assign a new lesson" do
      lesson = @lesson
      Lesson.should_receive(:new).and_return(lesson)
      get :new
      assigns(:lesson).should == lesson
    end
  end

  describe "POST 'create'" do
    it "should receive lesson parameters" do
      parameters = { "title" => 'teste'}
      @lesson.stub!(:save).and_return(true)
      Lesson.should_receive(:new).with(parameters).and_return(@lesson)
      post :create, :lesson => parameters
    end
    
    it "should save lesson object" do
      @lesson.should_receive(:save).and_return(true)
      Lesson.stub!(:new).and_return(@lesson)
      post :create, {}
    end
    
    context 'when it succeeds' do
      it "should redirect to lessons list" do
        post :create, {}
        response.should redirect_to(lessons_path)
      end
    end
    
    context 'when it not succeeds' do
      it "should render new template" do
        @lesson.stub!(:save).and_return(false)
        Lesson.stub!(:new).and_return(@lesson)
        post :create, {}
        response.should render_template("new")
      end
    end
  end
end
