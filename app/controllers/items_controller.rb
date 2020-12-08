class ItemsController < ApplicationController

    def index
        # page number defaults to 1 unless one is given
        items = get_filtered_items
        items = items.sort_by {|i| i.name}
        items = items.slice(10 * (desired_page_number - 1), 10)

        render json: {
            page: desired_page_number,
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

    def sample_item
        render json: Item.all.sample, only: [:id, :img_url]
    end

    def destroy
        Item.find_by_id(params[:id]).destroy
        render json: {
            message: 'The item was successfully deleted.'
        }
    end

    private

    def desired_page_number
        params[:page] ? params[:page].to_i : 1
    end

    def get_filtered_items
        output = Item.all
        if params[:category] && params[:category] != "all"
            output = output.select {|i| i.item_type == params[:category]}
        end
        if params[:query] && params[:query] != ""
            output = output.select do |i|
                i.name.downcase.include?(params[:query].downcase) || i.description.downcase.include?(params[:query].downcase)
            end
        end
        output
    end

end