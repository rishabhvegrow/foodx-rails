class FoodItemsController < ApplicationController
    before_action :set_food_item, only: [:update, :destroy]
    before_action :authenticate_user! # Add authentication if needed
  
    # POST /food_items
    def create
      @food_item = FoodItem.new(food_item_params)
  
      if @food_item.save
        render json: @food_item, status: :created
      else
        render json: @food_item.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /food_items/:id
    def update
      if @food_item.update(food_item_params)
        render json: @food_item
      else
        render json: @food_item.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /food_items/:id
    def destroy
      @food_item.destroy
      head :no_content
    end
  
    # GET /restaurants/:restid/food_items
    def get_food_items_of_restaurant
      @restaurant = Restaurant.find(params[:restid])
      @food_items = @restaurant.food_items
  
      render json: @food_items
    end
  
    private
  
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end
  
    def food_item_params
      params.require(:food_item).permit(:name, :price, :description, :restaurant_id, :image_url)
    end
  end
  