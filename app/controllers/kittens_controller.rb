class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy] 

  def index
    @kittens = Kitten.all
  end
  
  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
     redirect_to @kitten, notice:"you saved a kitten!!!"
    else
      render :new, notice:"Failed to save kitten"
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "You updated your kitten's info!!"
    else
      render :edit
    end
  end
 
  def destroy
    @kitten.destroy
    redirect_to root_path, notice: "Kitten was successfully removed from our database!!"
  end

  private
  def set_kitten
   @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
