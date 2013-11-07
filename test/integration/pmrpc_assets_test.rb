require 'test_helper'

class PmrpcAssetsTest < ActionDispatch::IntegrationTest
  test "pmrpc available to the main app" do
    get "/assets/pmrpc.js"
  end
end
