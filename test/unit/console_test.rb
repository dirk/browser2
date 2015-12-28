require "test_helper"

class ConsoleTest < Minitest::Test
  test "detects nintendo wii" do
    @browser = Browser.new ua: $ua["NINTENDO_WII"]

    assert @browser.console?
    assert @browser.nintendo?
  end

  test "detects nintendo wii u" do
    @browser = Browser.new ua: $ua["NINTENDO_WIIU"]

    assert @browser.console?
    assert @browser.nintendo?
  end

  test "detects playstation 3" do
    @browser = Browser.new ua: $ua["PLAYSTATION3"]

    assert @browser.console?
    assert @browser.playstation?
    refute @browser.playstation4?
  end

  test "detects playstation 4" do
    @browser = Browser.new ua: $ua["PLAYSTATION4"]

    assert @browser.console?
    assert @browser.playstation?
    assert @browser.playstation4?
  end

  test "detects xbox 360" do
    @browser = Browser.new ua: $ua["XBOX360"]

    assert @browser.console?
    assert @browser.xbox?
    refute @browser.xbox_one?
  end

  test "detects xbox one" do
    @browser = Browser.new ua: $ua["XBOXONE"]

    assert @browser.console?
    assert @browser.xbox?
    assert @browser.xbox_one?
  end

  test "detects psp" do
    @browser = Browser.new ua: $ua["PSP"]

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    refute @browser.psp_vita?
    assert @browser.mobile?
  end

  test "detects psp vita" do
    @browser = Browser.new ua: $ua["PSP_VITA"]

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    assert @browser.psp_vita?
    assert @browser.mobile?
  end
end
