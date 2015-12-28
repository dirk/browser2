require "test_helper"

class AdobeAirTest < Minitest::Test
  test "detects adobe air" do
    @browser = Browser.new ua: $ua["ADOBE_AIR"]

    assert @browser.adobe_air?
    assert @browser.webkit?
    assert_equal @browser.version, "13"
    assert_equal @browser.full_version, "13.0"
    assert_equal @browser.name, "Other"
  end
end
