require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    let!(:user) { create(:user) }
    before { get :show, params: { id: user.id } }
    it { expect(assigns(:user)).to eq(user) }
  end
  
end
