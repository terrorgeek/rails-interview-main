module ApplicationHelper
  def company_selected
    #if user clicked a company, we have params[:company_id]
    if params[:company_id].present?
      @company_to_show_in_master_page = Company.find_by(id: params[:company_id])
    else
      @company_to_show_in_master_page = current_user.companies.first
    end
  end
end
