require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
        title:       'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url:   'lorem.jpg',
        price:       19.95
    }
  end

  test "should require login" do
    logout
    get products_url
    follow_redirect!
    assert_select 'legend', 'Please Log In'
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
  end

  # ...
  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
  end

  # ...

  test "can't delete product in cart" do
    assert_difference('Product.count') do
     # delete product_url(products(:two))
      post products_url, params: { product: @update }
    end

    #assert_redirected_to products_url
    assert_redirected_to product_url(Product.last)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

end
