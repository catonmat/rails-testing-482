require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "check that the homepage loads correctly" do
    # navigate to the homepage
    visit '/'

    # see what our test runner sees
    save_and_open_screenshot

    # verify that the header text exists and it says Awesome Products
    assert_selector('h1', text: 'Awesome Products') 
    # => true OR false

    # test that the right number of cards loads on the page
    assert_selector '.card-product', count: Product.count
  end

  test 'user can create a new product' do
    # step 1: user logs in
    login_as users(:george)
    # step 2: user visits the 'new product page'
    visit '/products/new'
    save_and_open_screenshot
    # step 3: user fills in a form with new product info and submits it
    fill_in 'product_name', with: 'Le wagon'
    fill_in 'product_tagline', with: 'Change your life, learn to code.'
    save_and_open_screenshot

    click_on 'Create Product'
    save_and_open_screenshot
    # step 4: ensure we have successfully created the product in the database (redirect user to index)
    assert_equal(root_path, page.current_path) 
    assert_text('Change your life, learn to code.')
  end
end
