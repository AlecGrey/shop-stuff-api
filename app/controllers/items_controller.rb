class ItemsController < ApplicationController

    def index
        # page number defaults to 1 unless one is given
        page_number = params[:page] ? params[:page].to_i : 1
        # byebug

        if params[:category] || params[:query]
            items = filter_items(items: Item.all, query: params[:query], category: params[:category])
        else
            items = Item.all
        end

        items = items.slice(10 * (page_number - 1), 10)
        render json: {
            page: page_number,
            items: items, except: [:created_at, :updated_at, :description]
        }
    end

    def categories
        # action to render JSON of all categories of items in the database
        types = Item.all.map {|i| i.item_type}.uniq.sort
        render json: {
            categories: types
        }
    end

    private

    def filter_items(items:, query:, category:)
        output = items
        if category != "all"
            output = output.select {|i| i.item_type == category}
        end
        if query != "" && query != nil
            output = output.select do |i|
                i.name.downcase.include?(query.downcase) || i.description.downcase.include?(query.downcase)
            end
        end
        # byebug
        output
    end

end