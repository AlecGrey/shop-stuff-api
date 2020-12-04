class UsersController < ApplicationController

    def create
        # byebug
        user = User.find_or_create_by(name: params[:user_name])
        render json: user, only: [:name, :id]
    end

end