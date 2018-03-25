class SearchController < ApplicationController
  def show_results
    @title = 'Your Results'
    current_page = params[:page].to_i || 1

    @next_page = "/results?min_price=#{params[:min_price]}&max_price=#{params[:max_price]}&page=#{(current_page + 1).to_s}"

    @previous_page = nil
    if current_page > 1
      @previous_page = "/results?min_price=#{params[:min_price]}&max_price=#{params[:max_price]}&page=#{(current_page - 1).to_s}"
    end

    autolist_client = AutolistClient.new

    response = autolist_client.search(
      params[:min_price],
      params[:max_price],
      current_page
    )

    results = JSON.parse response.body
    @search_results = results['records']
  end
end
