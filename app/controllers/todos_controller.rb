class TodosController < ApplicationController
	skip_before_filter :verify_authenticity_token
	  respond_to :html, :xml, :json


	def index
		# @da=Todo.all
		# respond_with(@da) do |format|
		# 		format.json { render :json => @da.as_json}
		# 		# byebug
		#  end
  	#render json: Todo.all
  end
  def all
  	render json:Todo.all
  end
  def new
  	todo=Todo.new
  end
  def show
  	render text:"show"
  end
  def destroy
  	if Todo.destroy(params[:id])
  		render json: Todo.all
  	end
  end
  def create
  	@todo = Todo.new(todo_params)
  	if @todo.save
  		render json: Todo.all
  	else

  	end

  end
  private
  def todo_params
  	params.require(:todo).permit(:name)
  end
end
