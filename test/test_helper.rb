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
      item = Item.create(name: "gnar possum",
                         description: "a snowboard for shredding gnar pow",
                         price: 1000)
      item = Item.create(name: "gwar possum",
                         description: "a snowboard for gwar concerts",
                         price: 15)
    end

end
