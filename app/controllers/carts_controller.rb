class CartsController < ApplicationController

    def show
        cart = Cart.find(params[:id])
        render_cart_json(cart)
    end

    def create
        render_cart_json(Cart.create)
    end

    def add_item
        cart = Cart.find(params[:cart_id])
        cart.items << Item.find(params[:item_id])
        render_cart_json(cart)
    end

    def empty
        cart = Cart.find(params[:id])
        cart.cart_items.destroy_all
        render json: {
            message: 'your cart has been emptied.'
        }
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