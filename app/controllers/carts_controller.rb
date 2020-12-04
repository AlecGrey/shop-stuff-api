class CartsController < ApplicationController

    def show
        cart = Cart.find(params[:id])
        render_cart_json(cart)
    end

    def create
        # receive a user_id and find or create a cart instance. Render as JSON.
        if params[:user_id]
            cart = Cart.find(params[:user_id])
        else
            cart = Cart.create
        end
        render_cart_json(cart)
    end

    def add_item
        # byebug
        cart = Cart.find(params[:cart_id])
        cart.items << Item.find(params[:item_id])
        render_cart_json(cart)
    end

    private

    def render_cart_json(cart)
        render json: cart, 
            include: {
                items: {
                    only: [:name, :id]
                }
            }, 
            except: [:created_at, :updated_at]
    end

end