require "test_helper"
require "popme/verification"

describe Popme::Verification do
  it "should return true if url exists" do
    out = Popme::Verification.url_exists?("http://www.google.com")
    out.must_equal true
  end

  it "should false false if url does not exists" do
    out = Popme::Verification.url_exists?("http://wat.wat")
    out.must_equal false
  end  
end
