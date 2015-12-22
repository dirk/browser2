require "test_helper"

class FirefoxTest < Minitest::Test
  test "detects firefox" do
    @browser = Browser.new ua: $ua["FIREFOX"]

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    refute @browser.modern?
    assert_equal "3.8", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects modern firefox" do
    @browser = Browser.new ua: $ua["FIREFOX_MODERN"]

    assert_equal :firefox, @browser.id
    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert_equal "17.0", @browser.full_version
    assert_equal "17", @browser.version
  end

  test "detects firefox android tablet" do
    @browser = Browser.new ua: $ua["FIREFOX_TABLET"]

    assert_equal :firefox, @browser.id
    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert @browser.tablet?
    assert @browser.android?
    assert_equal "14.0", @browser.full_version
    assert_equal "14", @browser.version
  end
end
