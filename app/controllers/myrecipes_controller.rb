class MyrecipesController < ApplicationController
  before_action :find_myrecipe, only: [:destroy]
  before_action :validate_user_recipes, only: [:destroy]

#show all the saved recipes
  def show
    @allrecipes = current_user.myrecipes
  end


#save a recipe to the account
  def create
    @myrecipe = Myrecipe.new({label: params["label"], image: params["image"], url: params["url"]})
    current_user.myrecipes << @myrecipe


    unless @myrecipe.save
      flash[:error] = "Fail to save to my recipes."
    end

    redirect_to :back
    #if redirect_to :back does work, try this " We had an def new where we set session[:return_to] = request.referer in the def create we added redirect_to session[:return_to]."
  end

#Delete a recipe in the account
  def destroy
    @myrecipe.destroy
    redirect_to action: "show"
  end

  private

  def find_myrecipe
    @myrecipe = Myrecipe.find(params[:id].to_i)
  end

  def validate_user_recipes
    if !current_user.myrecipes.include? @myrecipe
      # raise ActionController::RoutingError.new('Not Found')
      flash[:notice] = "No recipes saved."
    end
  end
end
