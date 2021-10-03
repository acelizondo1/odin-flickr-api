class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new ENV["flickr_api_key"], ENV["flickr_api_secret"]

        unless params[:flickr_id].blank?
            begin 
                user = flickr.people.findByUsername :username => params[:flickr_id]
                flickr_id = user.id
            rescue
                flickr_id = params[:flickr_id]
            ensure
                begin
                    @pictures_list = flickr.people.getPublicPhotos :user_id => flickr_id
                    @user = flickr.people.getInfo :user_id => flickr_id
                rescue => e
                    message = e.message.split("-")
                    flash[:alert] = message[1] + " - Please Try Again"
                end
            end
        else
            if params.has_key?(:flickr_id)
                flash[:alert] = "Please Enter a Valid User ID" 
            end
        end
    end

end