# frozen_string_literal: true

require 'rails_helper'

describe '/card', type: :request do
  describe 'GET /cards/top' do
    subject { get url }

    let(:url) { '/cards/top' }

    let(:card) { create(:card) }

    before do
      card
    end

    it 'return 200' do
      subject
      expect(response.status).to eq 200
    end
  end
end
