require 'rails_helper'

describe 'Foods API' do
  context 'when I send a DELETE request to /api/v1/foods/:id' do
    it 'A 204 status is rendered' do
      create(:food)

      delete '/api/v1/foods/1'

      expect(response).to be_successful
      expect(response.status).to eq(204)
    end
  end

end
