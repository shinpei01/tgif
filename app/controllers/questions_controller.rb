class QuestionsController < ApplicationController
  def home
    @question = Question.new
    @questions = Question.all
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_url
    else
      @question = []
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.countnum += 1
    @question.save
    set_cookie
    redirect_to root_path
  end

  private
    def question_params
      params.require(:question).permit(:content, :countnum)
    end

    def set_cookie
      id = @question.id.to_s
      id = id.to_sym
      cookies[id] = {:value => {}} if cookies[id].blank?
      cookies[id] = {:value => true, :expires => 1.days.from_now }
    end

    def aleady_pushed id
      id = id.to_s
      id = id.to_sym
      cookies[id]
    end

end
