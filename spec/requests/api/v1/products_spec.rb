RSpec.describe '/api/v1/products' do
  describe 'GET /' do
    subject { -> { get api_v1_products_path } }

    let!(:product) { create(:product) }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'responds with the products' do
      subject.call
      expect(parsed_response).to match_array([
        a_hash_including('id' => product.id)
      ])
    end
  end

  describe 'GET /:id' do
    subject { -> { get api_v1_product_path(product) } }

    let!(:product) { create(:product) }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'responds with the product' do
      subject.call
      expect(parsed_response).to match(a_hash_including(
        'id' => product.id
      ))
    end
  end

  describe 'POST /' do
    subject { -> { post api_v1_products_path, product.to_json } }

    let(:product) { attributes_for(:product) }

    it 'responds with 201 Created' do
      subject.call
      expect(last_response.status).to eq(201)
    end

    it 'creates a new product' do
      expect(subject).to change(Product, :count).by(1)
    end

    it 'responds with the new product' do
      subject.call
      expect(parsed_response).to match(a_hash_including(product.stringify_keys))
    end
  end

  describe 'PATCH /:id' do
    subject do
      proc do
        patch api_v1_product_path(product), new_product.to_json
        product.reload
      end
    end

    let!(:product) { create(:product) }
    let(:new_product) { attributes_for(:product) }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'updates the product' do
      subject.call
      expect(product.as_json).to match(a_hash_including(new_product.stringify_keys))
    end

    it 'responds with the updated product' do
      subject.call
      expect(parsed_response).to match(a_hash_including(new_product.stringify_keys))
    end
  end

  describe 'DELETE /:id' do
    subject { -> { delete api_v1_product_path(product) } }

    let!(:product) { create(:product) }

    it 'deletes the product' do
      expect(subject).to change(Product, :count).by(-1)
    end

    it 'responds with 204 No Content' do
      subject.call
      expect(last_response.status).to eq(204)
    end
  end
end
