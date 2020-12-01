class ItemsController < ApplicationController

    def index
        items = Item.all
        render json: items, except: [:created_at, :updated_at, :description]
    end

end