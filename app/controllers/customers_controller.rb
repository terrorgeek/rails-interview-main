class CustomersController < ApplicationController
  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  include LoginConcerns

  def index
    set_a_instance_variable
    @customers = current_user.companies.first.customers
    #@customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params.merge({company: current_user.companies.first}))

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params.merge({company: current_user.company}))
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = current_user.companies.first.customers.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end
end
