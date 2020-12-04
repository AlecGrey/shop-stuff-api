class ScoresController < ApplicationController

    def create
        # byebug
        points = Cart.find(params[:cart_id]).items.length * 100
        points = points - (params[:skips] * 50)
        score = Score.create(score: points, name: sample_name)
        render json: score, only: [:score, :name]
    end

    private

    def sample_name
        names = [
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
        ]
        names.sample
    end

end