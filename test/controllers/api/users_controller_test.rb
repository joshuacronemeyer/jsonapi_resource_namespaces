require 'test_helper'

class Core::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user from api" do
    user = Core::User.create()
    get api_user_url(id: user.id), nil, {"ACCEPT" => "application/vnd.api+json","CONTENT-TYPE" => "application/vnd.api+json"}
    assert_response :success
  end

  test "should get user from api with address association" do
    user = Core::User.create()
    address = user.addresses.create
    get api_user_url(id: user.id, include: "addresses"), nil, {"ACCEPT" => "application/vnd.api+json","CONTENT-TYPE" => "application/vnd.api+json"}
    assert_response :success
    assert_equal address.id.to_s, JSON.parse(@response.body)["data"]["relationships"]["addresses"]["data"].first["id"]
  end

  test "should get user from api with credit_card association" do
    user = Core::User.create()
    address = user.addresses.create
    get api_user_url(id: user.id, include: "credit_cards"), nil, {"ACCEPT" => "application/vnd.api+json","CONTENT-TYPE" => "application/vnd.api+json"}
    assert_response :success
    assert_equal credit_card.id.to_s, JSON.parse(@response.body)["data"]["relationships"]["credit_cards"]["data"].first["id"]
  end

  test "should get user from api with both associations" do
    user = Core::User.create()
    address = user.addresses.create
    credit_card = user.credit_cards.create
    get api_user_url(id: user.id, include: "addresses, credit_cards"), nil, {"ACCEPT" => "application/vnd.api+json","CONTENT-TYPE" => "application/vnd.api+json"}
    assert_response :success
    assert_equal address.id.to_s, JSON.parse(@response.body)["data"]["relationships"]["addresses"]["data"].first["id"]
    assert_equal credit_card.id.to_s, JSON.parse(@response.body)["data"]["relationships"]["credit_cards"]["data"].first["id"]
  end
  
end

