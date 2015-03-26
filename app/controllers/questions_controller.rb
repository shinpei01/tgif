class QuestionsController < ApplicationController
  def home
    @question = Question.new
    @questions = Question.all.paginate(page: params[:params])
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
    # DBのcountnumをインクリメントする
    @question = Question.find(params[:id])
    @question.countnum += 1
    @question.save
    set_cookie

    redirect_to root_path

    # Ajaxを設定しようとしたがダメだった。remoto trueも解除
    # 多分パーシャルを作ってJsonからそこに飛ばせば動作する？
    # respond_to do |format|
    #   format.js
    # end

  end

  private
    def question_params
      params.require(:question).permit(:content, :countnum)
    end

  def set_cookie
    cookies[:hoge] = { :value => 't', :expires => 1.days.from_now }
  end

end
