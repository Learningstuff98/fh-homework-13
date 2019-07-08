class RpnsController < ApplicationController

  def index
    @rpns = Rpn.all
  end

  def new
    @rpn = Rpn.new
  end

  def create
    @rpn = Rpn.create(rpn_params)
    @rpn.update_attribute(:answer, @rpn.evaluate(@rpn.input))
    redirect_to root_path
  end

  private

  def rpn_params
    params.require(:rpn).permit(:input)
  end

end
