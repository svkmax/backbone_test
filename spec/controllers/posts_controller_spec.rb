require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe 'GET index' do
    let!(:posts) { create_list(:post, 10) }
    let(:index_request) { get :index, format: :json }
    let(:index_response) { JSON.parse response.body }

    context 'response' do
      before { index_request }

      it 'should have status 200' do
        expect(response).to have_http_status(200)
      end

      it 'should have posts' do
        expect(index_response.count).to eq 10
        index_response.each do |post|
          expect(post['name']).to be_present
          expect(post['title']).to be_present
          expect(post['message']).to be_present
          expect(post['created_at']).to be_present
        end
      end
    end
  end
end
