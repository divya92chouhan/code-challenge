require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'DELETE destroy' do
    before(:each) do
      @company = create(:company)
    end

    context '#destroy' do
      it '#successfully destroy' do
        expect { delete :destroy, params: { id: @company.id } }.to change { Company.count }.by(-1)
      end

      it 'redirect_to index' do
        delete :destroy, params: { id: @company.id }

        expect(response).to redirect_to(companies_path)
      end
    end  
  end
end
