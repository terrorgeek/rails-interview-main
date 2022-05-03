RSpec.shared_context "shared users data setup", :setup => :controller do
  let!(:user) {create(:user, email: "the@plumber.com", password: "12345678", first_name: "The", last_name: "Plumber")}
  let!(:company1) {create(:company, name: "Plumbing fucker")}
  let!(:company2) {create(:company, name: "Plate fucker")}
  let!(:company_user1) {create(:company_user, company_id: company1.id, user_id: user.id) }
  let!(:company_user2) {create(:company_user, company_id: company2.id, user_id: user.id) }
end
