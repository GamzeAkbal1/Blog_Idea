class IdeasController < ApplicationController
	before_action :set_idea, only: [:show, :update, :edit, :destroy]

	def new
		@idea=Idea.new
	end

	def index
		@ideas = Idea.all
	end

	
	def show
		
	end

	def create

		@idea=Idea.create(idea_params)
		if @idea.save
			flash[:success] = "Kayıt Basarıyla Olusturuldu!"
			redirect_to idea_path(@idea)
		else
			render :new
        end
	end
	
	def idea_params
		params.require(:idea).permit(:title, :description, :planned_to)
	end
	
	def edit
		
	end

	def update
		
		if @idea.update(idea_params)
			redirect_to idea_path(@idea)
		else
			render :edit
		end
	end

	def destroy
		
		@idea.destroy
		redirect_to ideas_path	
	end

	def set_idea
		@idea = Idea.find(params[:id])
	end
end
