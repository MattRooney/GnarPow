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
    contents.select { |item, _quantity| item == params[:id] }
      .map do |item, _quantity|
      contents[item] = params[:quantity].to_i
    end
  end

  def remove_items(params)
    contents.delete_if { |item_id, _quantity| item_id == params[:id] }
  end
end
