class ScoresController < ApplicationController

    def index
        scores = Score.all.sort_by {|s| s.score}.reverse.slice(0, 10)
        render json: scores, 
            only: :score,
            include: {
                user: {only: [:name, :id]}
            }
    end

    def create
        # byebug
        points = Cart.find(params[:cart_id]).items.length * 100
        points = points - (params[:skips] * 50)
        user = User.find(params[:user_id])
        score = Score.create(score: points, user_id: user.id)
        render json: {
            score: score.score,
            user: user.name
        }
    end

    private

    def sample_name
        [
            'Alex',
            'Amanda',
            'Clay',
            'Ellaine',
            'Hal',
            'Inee',
            'Jesse',
            'Kevin',
            'Kim',
            'Lantz',
            'Marisa',
            'Matty',
            'Michael',
            'Milan',
            'Rodrigo',
            'Stephen',
            'Tony',
            'Will L',
            'Will G'
        ].sample
    end

end