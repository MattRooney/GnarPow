ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest

  include Capybara::DSL

  def teardown
    reset_session!
  end
end
module CategoryItemsSetup
  def create_categories_and_items
    @category     = Category.create(title: "Snowboards")
    @category_two = Category.create(title: "Apparel")

    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000,
                category_id: @category.id)
    Item.create(name: "gwar possum",
                description: "a snowboard for gwar concerts",
                price: 15,
                category_id: @category.id)
    Item.create(name: "Sweet Jacket",
                description: "Keeps you warm",
                price: 240,
                category_id: @category_two.id)
    Item.create(name: "Hoody",
                description: "Keeps you slightly warm",
                price: 80,
                category_id: @category_two.id)
  end

  def create_items
    Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000)
    Item.create(name: "gwar possum",
                description: "a snowboard for gwar concerts",
                price: 15)
  end

  def create_items_and_order
    @category     = Category.create(title: "Snowboards")
    @category_two = Category.create(title: "Apparel")
    item_1 = Item.create(name: "gnar possum",
                description: "a snowboard for shredding gnar pow",
                price: 1000,
                category_id: @category.id)
    item_2 = Item.create(name: "gwar possum",
                description: "a snowboard for gwar concerts",
                price: 15,
                category_id: @category.id)
    item_3 = Item.create(name: "Hoody",
                description: "Keeps you slightly warm",
                price: 80,
                category_id: @category_two.id)
    Order.create(current_status: "completed")
  end

  def create_user
    User.create(username: "Matt", password: "gnargnar")
  end

  def login_a_user
    create_user
    visit login_path

    within(".login_form") do
      fill_in "Username", with: "Matt"
      fill_in "Password", with: "gnargnar"
      click_button "Login"
    end
  end

  def add_items_to_cart
    item_1 = Item.create(name: "gnar possum",
                         description: "a snowboard for shredding gnar pow",
                         price: 1000)
    item_2 = Item.create(name: "gnar possum",
                         description: "a snowboard for shredding gnar pow",
                         price: 1000)
    item_3 = Item.create(name: "Sweet Jacket",
                         description: "Keeps you warm",
                         price: 240)

    visit items_path
    within("#item_#{item_1.id}") do
      click_link "Add To Cart"
    end
    within("#item_#{item_2.id}") do
      click_link "Add To Cart"
    end
    within("#item_#{item_3.id}") do
      click_link "Add To Cart"
    end
  end
end
