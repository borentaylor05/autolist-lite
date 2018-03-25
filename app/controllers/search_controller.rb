class SearchController < ApplicationController
  def show_results
    @title = 'Your Results'
    current_page = params[:page].to_i > 0 ? params[:page].to_i : 1

    autolist_client = AutolistClient.new

    response = autolist_client.search(
      params[:min_price],
      params[:max_price],
      current_page
    )

    results = JSON.parse response.body
    @search_results = results['records']

    # this doesn't account for the case of a total number of listing  
    # that is divisible by 20, but I'm ignoring that for now and allowing 
    # the user to see a blank page in that case
    @next_page = @search_results.length == 20 ?
      "/results?min_price=#{params[:min_price]}&max_price=#{params[:max_price]}&page=#{(current_page + 1).to_s}" :
      nil

    @previous_page = current_page > 1 ? 
      "/results?min_price=#{params[:min_price]}&max_price=#{params[:max_price]}&page=#{(current_page - 1).to_s}" :
      nil
    
    # this is terrible and would find a better way to save this info with more time
    @search_results.each do |result|
      listing = Listing.new(
        vin: result['vin'],
        year: result['year'],
        make: result['make'],
        model: result['model'],
        primary_photo_url: result['primary_photo_url'],
        price: result['price'],
        city: result['city'],
        state: result['state'],
        mileage_humanized: result['mileage_humanized']
      )

      if listing.valid?
        listing.save
      else
        logger.warn listing.errors.full_messages
      end
    end
  end
end
