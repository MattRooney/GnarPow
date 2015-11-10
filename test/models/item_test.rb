require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "we can create a new item with valid attributes" do
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image_file_name: 'hi.png')

    assert item.save
  end

  test "we cannot create a new item without a name" do
    item = Item.create(description: "a snowboard for shredding gnar pow",
                       price: 1000,
                       image_file_name: 'hi.png')

    refute item.save
  end

  test "we cannot create a new item without a price" do
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       image_file_name: 'hi.png')

    refute item.save
  end

  test "we cannot create a new item with invalid attributes" do
    item = Item.create(name: "gnar possum",
                       description: "a snowboard for shredding gnar pow",
                       price: "hey",
                       image_file_name: 'hi.png')

    refute item.save
  end



end
