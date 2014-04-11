require 'test_helper'

class TestClient < Minitest::Test
  def setup
    @client = Delivery::Client.new 'client_id', base_uri: 'http://sandbox.delivery.com'
  end

  def test_search
    stub_request(:get, 'http://sandbox.delivery.com/merchant/search/delivery?client_id=client_id&address=199%20Water%20St%2010038').
      to_return(body: fixture('search.json'), headers: {content_type: 'application/json'})

    search = @client.search '199 Water St 10038'
    assert_equal 40.706888574096, search.search_address.latitude
  end
end
