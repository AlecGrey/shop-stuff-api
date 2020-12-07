class UsersController < ApplicationController

    def create
        user = User.find_or_create_by(name: params[:user_name])
        render_user_json(user)
    end

    def update
        user = User.find(params[:id])
        user.update(sanitized_params)
        render_user_json(user)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {
            message: 'the user has been removed from the database.'
        }
    end

    private

    def sanitized_params
        params.require(:user).permit(:name)
    end

    def render_user_json(user_instance)
        render json: user_instance, only: [:name, :id]
    end
end