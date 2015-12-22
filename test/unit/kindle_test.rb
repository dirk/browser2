require "test_helper"

class KindleTest < Minitest::Test
  test "detects kindle monochrome" do
    @browser = Browser.new ua: $ua["KINDLE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  test "detects kindle fire" do
    @browser = Browser.new ua: $ua["KINDLE_FIRE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  test "detects kindle fire hd" do
    @browser = Browser.new ua: $ua["KINDLE_FIRE_HD"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    refute @browser.mobile?
  end

  test "detects kindle fire hd mobile" do
    @browser = Browser.new ua: $ua["KINDLE_FIRE_HD_MOBILE"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.mobile?
  end
end
