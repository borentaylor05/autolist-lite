class ListingsController < ApplicationController
    def show
        logger.info params[:vin]
        @listing = Listing.find_by(vin: params[:vin])

        @listing.update_attributes!(view_count: @listing.view_count + 1)
    end
end
