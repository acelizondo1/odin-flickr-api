class StaticPagesController < ApplicationController
    require 'flickr'

    def index
        flickr = Flickr.new "38df1bf08bb5c17a7702895b4572e302", "a8e7cdaf7685b20f"

        if params[:flickr_id].blank?
            #@lists = flickr.photos.getRecent
        else

        end
    end

end