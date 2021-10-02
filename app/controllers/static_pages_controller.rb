class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new "38df1bf08bb5c17a7702895b4572e302", "a8e7cdaf7685b20f"

        unless params[:flickr_id].blank?
            puts params[:flickr_id]
            @pictures_list = flickr.people.getPublicPhotos :user_id => params[:flickr_id]
        end
    end

end