MAX_PRICE = 200000
PRICE_INCREMENT = 10000
NUM_PRICES = MAX_PRICE / PRICE_INCREMENT

class HomeController < ApplicationController
  def index
    prices = (0..NUM_PRICES).map { |price_num| price_num * PRICE_INCREMENT }
    @min_prices = prices.slice(0, prices.length - 1)
    @max_prices = prices.slice(1, prices.length)
    logger.info @max_prices

    @title = 'Welcome to Autolist-Lite'
    logger.info "@title"
    @subtitle = 'Start searching for your next vehicle'
  end
end
