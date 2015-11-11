require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "a new item with all attributes is valid" do
    item = Item.new(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image_file_name: 'hi.png')

    assert item.valid?
  end

  test "it cannot create a new item without a name" do
    item = Item.new(description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image_file_name: 'hi.png')

    refute item.valid?
  end

  test "it cannot create a new item without a price" do
    item = Item.new(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       image_file_name: 'hi.png')

    refute item.valid?
  end

  test "it cannot create a new item with a price that is not an integer" do
    item = Item.new(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: "hey",
                       image_file_name: 'hi.png')

    refute item.valid?
  end

end
