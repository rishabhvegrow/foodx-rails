class CartItemsController < ApplicationController
    before_action :set_cart_item, only: [:remove, :checkout]
    before_action :authenticate_user! # Add authentication if needed
  
    # DELETE /cart_items/:id/remove
    def remove
      if !@cart_item.is_checked_out
        @cart_item.destroy
        head :no_content
      else
        render json: { error: "CartItem cannot be deleted because it is checked out" }, status: :forbidden
      end
    end
  
    # GET /cart_items
    def get_cart_details
      @cart_items = current_user.cart_items.where(is_checked_out: false)
      if @cart_items.empty?
        render json: { error: "No items added in the cart" }, status: :internal_server_error
      else
        render json: @cart_items
      end
    end
  
    # POST /cart_items/checkout
    def checkout_cart
      @cart_items = current_user.cart_items.where(is_checked_out: false)
      if @cart_items.empty?
        render json: { error: "No items added to the cart" }, status: :internal_server_error
        return
      end
  
      transaction = current_user.transactions.create
      @cart_items.update_all(is_checked_out: true, transaction_id: transaction.id)
  
      if transaction.valid?
        render json: { message: "Transaction successful", transaction: transaction }, status: :ok
      else
        render json: { error: "Unable to checkout, Please try again" }, status: :internal_server_error
      end
    end
  
    # GET /cart_items/ordered
    def get_ordered_items
      @cart_items = current_user.cart_items.where(is_checked_out: true)
      if @cart_items.empty?
        render json: { error: "No items added in the Orders" }, status: :internal_server_error
      else
        render json: @cart_items
      end
    end
  
    private
  
    def set_cart_item
      @cart_item = current_user.cart_items.find(params[:id])
    end
  end
  