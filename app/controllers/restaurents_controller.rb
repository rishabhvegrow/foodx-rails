class RestaurentsController < ApplicationController
    before_action :set_restaurant, only: [:show, :update, :destroy]

    def ping
      render json: "PONG", status: :ok
    end
  
    # GET /restaurants
    def index
      @restaurants = Restaurant.all
      render json: @restaurants
    end
  
    # GET /restaurants/1
    def show
      render json: @restaurant
    end
  
    # POST /restaurants
    def create
      @restaurant = Restaurant.new(restaurant_params)
  
      if @restaurant.save
        render json: @restaurant, status: :created
      else
        render json: @restaurant.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /restaurants/1
    def update
      if @restaurant.update(restaurant_params)
        render json: @restaurant
      else
        render json: @restaurant.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /restaurants/1
    def destroy
      @restaurant.destroy
      head :no_content
    end
  
    private
  
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
  
    def restaurant_params
      params.require(:restaurant).permit(:name, :type, :address, :contact, :rating, :image_url)
    end
  end
  