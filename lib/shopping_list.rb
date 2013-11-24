require 'csv'
require_relative 'item'

class ShoppingList
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def items
    @items ||= build_items
  end

  private

  def build_items
    load_data.map do |item|
      Item.new(item)
    end
  end

  def load_data
    CSV.open(filename, headers: true, header_converters: :symbol)
  end
end

