require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController, type: :request do
    describe 'POST #create' do
        # valid payload
        let(:valid_attributes) { { 'user': { 'email': 'adush@dhcs.ae', 'password': 'chyuguygcde76', 'password_confirmation': 'chyuguygcde76' } } }

        context 'when the request is valid' do
            before { post '/api/users.json', params: valid_attributes }

            it 'creates a user' do
                expect(json['email']).to eq('adush@dhcs.ae')
            end
        
            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the request is invalid' do
            before { post '/api/users.json', params: { 'user': { 'password': 'chyuguygcde76', 'password_confirmation': 'chyuguygcde76' } } }

            it 'returns a validation failure message' do
                expect(response.body)
                    .to match("{\"errors\":{\"email\":[\"can't be blank\",\"can't be blank\"]}}")
            end
        
            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end
        end
    end
end