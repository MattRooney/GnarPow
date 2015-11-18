class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def update_quantity(params)
    contents[(params[:id])] = params[:quantity].to_i
  end

  def remove_items(params)
    contents.delete_if { |item_id, _quantity| item_id == params[:id] }
  end

  def complete_cart
    {
      items: items,
      total_price: total_price
    }
  end

  def items
    item_ids = contents.keys
    Item.find(item_ids)
  end

  def total_price
    contents.map do |item_id, quantity|
      Item.find(item_id.to_i).price * quantity
    end
      .sum
  end

  def items
    contents.map do |item_id, count|
      item = Item.find(item_id)
      CartItem.new(item, count)
    end
  end
end

class CartItem < SimpleDelegator
  attr_accessor :count

  def initialize(item, count)
    super(item)

    @count = count
  end
end
