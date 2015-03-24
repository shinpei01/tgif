class MicropostsController < ApplicationController
  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to root_url
    else
      @micropost = []
    end
  end
end


private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
