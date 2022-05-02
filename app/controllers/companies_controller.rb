class CompaniesController < ApplicationController
  before_action :authorize

  include ApplicationHelper

  def index
    @companies = current_user.companies
  end
  
  def show
    @company = Company.find_by(id: params[:id])
    if @company.present? 
      @customers = @company.customers
    else
      render text: "company not found"
    end
  end
end
