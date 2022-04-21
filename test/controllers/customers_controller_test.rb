require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @user = User.create first_name: 'foo', last_name: 'bar', email: 'foo.bar@foo.com', password: '12345678', password_confirmation: '12345678'
    @company = Company.create name: 'test'
    @company.users << @user
    @customer = @company.customers.create first_name: 'first', last_name: 'last', email: 'first.last@foo.com'
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, params: { customer: { email: 'bar@foo.com', first_name: 'bar', last_name: 'foo' } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get :show, params: { id: @customer.id }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @customer.id }
    assert_response :success
  end

  test "should update customer" do
    patch :update, params: { id: @customer.id, customer: { email: @customer.email, first_name: @customer.first_name, last_name: @customer.last_name } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, params: { id: @customer.id }
    end

    assert_redirected_to customers_url
  end
end
