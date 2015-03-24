class QuestionsPagesController < ApplicationController
  def home
    @micropost = Micropost.new
    @microposts = Micropost.all.paginate(page: params[:params])
  end
end
