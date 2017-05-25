class PlaysController < ApplicationController
    
    before_action :find_play, only: [:show, :edit, :update, :destroy]
    
    
def index
    @plays = Play.all.order("created_at DESC")
end

def show
end

def update
    if @play.update(play_params)
        redirect_to play_path(@path)
    else 
        render 'new'
    end
end

def new
    @play = current_user.play.build
end

def create
    @play = current_user.play.build(play_params)
    
    if @play.save
        redirect_to root_path
    else
        render 'new'
    end
end

def destroy 
    @play.destroy
    redirect_to root_path
end
    
private
    
def play_params
    (params.require(:play).permit(:title, :description, :director))
end

def find_play
    @play = Play.find(params[:id])
end
    
end
