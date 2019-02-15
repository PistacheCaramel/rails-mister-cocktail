class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
     @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  # def edit
  #   @cocktail = Cocktail.find(params[:id])
  # end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def update
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.update(params.require(:cocktail).permit(:title, :details, :completed))
  #   redirect_to task_path(@task)
  # end

  # def destroy
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.destroy
  #   redirect_to tasks_path
  # end
  private
  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end

