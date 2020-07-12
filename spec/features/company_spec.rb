require 'rails_helper'

RSpec.feature 'Company feature spec', type: :feature, js: true do
  before :each do
    @company = create(:company)
  end

  scenario 'delete company by clicking on delete link' do
    visit  company_path(@company)
    find_delete_link = find_link 'Delete', href: company_path(@company)
    expect(find_delete_link['data-confirm']).to match 'Are you sure?'
    
    expect do
      accept_alert do
        find_delete_link.click
      end

      sleep 1
    end.to change(Company, :count).by(-1)
  end
end
