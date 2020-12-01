class ItemsController < ApplicationController

    def index
        items = Item.all
        render :json
    end

end