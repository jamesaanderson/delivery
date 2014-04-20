require 'test_helper'

class TestClient < Minitest::Test
  def setup
    @client = Delivery::Client.new 'client_id', base_uri: 'http://sandbox.delivery.com'
  end

  def test_search
    stub_request(:get, 'http://sandbox.delivery.com/merchant/search/delivery?client_id=client_id&address=199%20Water%20St%2010038&method=delivery').
      to_return(body: fixture('search.json'), headers: {content_type: 'application/json'})

    search = @client.search '199 Water St 10038', method: 'delivery'
    assert_equal 40.706888574096, search.search_address.latitude
  end

  def test_info
    stub_request(:get, 'http://sandbox.delivery.com/merchant/752?client_id=client_id').
      to_return(body: fixture('info.json'), headers: {content_type: 'application/json'})

    info = @client.info 752
    assert_equal 40.70479, info.merchant.location.latitude
  end

  def test_menu
    stub_request(:get, 'http://sandbox.delivery.com/merchant/752/menu?client_id=client_id').
      to_return(body: fixture('menu.json'), headers: {content_type: 'application/json'})

    menu = @client.menu 752
    assert_equal 'Monday Lunch Specials', menu.menu.first.name
  end

  def test_hours
    stub_request(:get, 'http://sandbox.delivery.com/merchant/752/hours?client_id=client_id').
      to_return(body: fixture('hours.json'), headers: {content_type: 'application/json'})

    hours = @client.hours 752
    assert_equal 'Underground Pizza', hours.merchant_name
  end
end
