require 'rails_helper'

RSpec.describe TwitsController, type: :controller do

  describe 'GET #show' do
    let!(:twit) { create(:twit) }
    before { get :show, params: { id: twit.id } }
    it { expect(assigns(:twit)).to eq(twit) }
  end

end
