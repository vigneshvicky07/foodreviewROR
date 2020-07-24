module Api
    class ReviewController < ApplicationController
        skip_before_action :verify_authenticity_token


        def create
            data_sent = ActiveSupport::JSON.decode(request.body.read)
            # binding.pry
            Food.find_by(name: data_sent["foodname"]).reviews.create(data_sent["review"])
            render json: @refer
            
        end
    end
end