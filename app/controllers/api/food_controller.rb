module Api

    class FoodController < ApplicationController
        skip_before_action :verify_authenticity_token
        # wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
        def create
            
            # binding.pry
            puts (request)
            data_sent = ActiveSupport::JSON.decode(request.body.read)
            # data_sent.delete_if {|key, value| value.blank?  }
            # if data_sent["category"].blank? || data_sent["theame"].blank? || data_sent["name"].blank? || data_sent["category"].blank?
                # render json:{ data:"invalid params"}, status: 404
          if 
                data_sent["timings"].each do |j|
                    if !j.blank?
                        data_sent[j] = true
                    
                       
                    end
                end
                data_sent.delete("timings")
                theamedata = Theme.find_by(name: data_sent["theame"])
                categorydata = Category.find_by(name:  data_sent["category"])
                data_sent.delete("theame")
                data_sent.delete("category")
                data_sent["category"] = categorydata
                data_sent["theme"] = theamedata
                
                Food.create(data_sent)
                  render json:data_sent

            else
            # puts(createparams[:name])
                # @value = Food.new(data_sent)
                # @value.save
                render json:{ data:"invalid params"}, status: 404
            end
        end
        
        
        def getfood
            # binding.pry()
            data_sent = ActiveSupport::JSON.decode(request.body.read)
            data_sent.delete_if {|key, value| value.blank?  }
            if !data_sent["filter"].blank?
                filter = data_sent["filter"]
                # foods = Food.all.joins(:reviews,:category,:theme).where("categories.name = 'meals'" )
                # Food.all.as_json(include:{reviews:{}})
                foods = Food.all.includes(:theme,:reviews,:category).group_by{|category| category.category.name}
                foods =  foods.as_json(include:{reviews:{},category:{},theme:{}})
            end
            # user_sent = JSON.parse(foods)

            # @getting =  Food.first.reviews
            # users.each do |user|
            #     user.address.city
            #   end
            # # puts(@getting)
            render json: foods
        end
        
        
        
        private
        def createparams
            params.permit(:name, :rate, :theame, :category)
        end

    end
end