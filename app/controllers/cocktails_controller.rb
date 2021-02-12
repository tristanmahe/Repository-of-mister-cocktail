class CocktailsController < ApplicationController

def index
  @cocktails = Cocktail.all
end

def show
  @cocktail = Cocktail.find(params[:id])
  @dose = Dose.new
  @dose.cocktail = @cocktail
  #@review = Review.new
end

def new
  @cocktail = Cocktail.new
end

def create
  @cocktail = Cocktail.new(params_cocktail)

  if @cocktail.save
    redirect_to cocktail_path(@cocktail)
    #redirige vers la show de cocktail
  else
    render 'new'
  end
end

private

def params_cocktail
  params.require(:cocktail).permit(:name) 
end

end
