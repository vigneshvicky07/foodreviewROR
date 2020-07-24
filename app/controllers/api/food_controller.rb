module Api

    class FoodController < ApplicationController
        skip_before_action :verify_authenticity_token
        # wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
        def create
            
            # binding.pry
            puts (request)
            data_sent = ActiveSupport::JSON.decode(request.body.read)
            # data_sent.delete_if {|key, value| value.blank?  }
            if data_sent["category"].blank? || data_sent["theame"].blank? || data_sent["name"].blank? || data_sent["category"].blank?
                render json:{ data:"invalid params"}, status: 404
               
            else
            # puts(createparams[:name])
                @value = Food.new(data_sent)
                @value.save
                render json:{ data:"created successfully"}, status: 422
            end
        end
        
        
        def getfood
            # binding.pry()
            data_sent = ActiveSupport::JSON.decode(request.body.read)
            data_sent.delete_if {|key, value| value.blank?  }

            users =  Food.all.as_json(include:{reviews:{}})
            # Food.all.as_json(include:{reviews:{}})
            # user_sent = ActiveSupport::JSON.decode(users)

            # @getting =  Food.first.reviews
            # users.each do |user|
            #     user.address.city
            #   end
            # # puts(@getting)
            render json: users
        end
        
        
        
        private
        def createparams
            params.permit(:name, :rate, :theame, :category)
        end

    end
end