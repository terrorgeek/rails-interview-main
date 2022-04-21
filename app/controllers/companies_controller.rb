class CompaniesController < ApplicationController
  before_action :authorize

  def show
    @company = current_user.company
  end
end
