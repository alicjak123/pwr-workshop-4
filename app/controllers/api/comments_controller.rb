class Api::CommentsController < ApplicationController

	def index
		dig = Dig.find(params[:dig_id])
    render json: dig.comments.all
  end

  def show
  	comment = Comment.find(params[:id])
    render json: comment
  end
  
end
