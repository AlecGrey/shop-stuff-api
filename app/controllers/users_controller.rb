class UsersController < ApplicationController

    def login
        user = User.find_by(name: username)
        if user
            render_user_json(user)
        else
            render json: {
                message: "User not found"
            }
        end
    end

    def create
        user = User.new(name: username)
        if user.save
            render_user_json(user)
        else
            render json: {
                message: user.errors.full_messages
            }
        end
    end

    def update
        # byebug
        user = User.find(params[:id])
        user.update(sanitized_params)
        if user.name == params[:user][:name]
            render_user_json(user)
        else
            render json: {message: 'could not update user!'}
        end
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

    def username
        params[:username].strip
    end
end