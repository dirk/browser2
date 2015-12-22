require 'test_helper'

require 'minitest/benchmark'

class BenchmarkTest < Minitest::Benchmark
  def self.bench_range
    [100, 10_000]
  end


  def bench_chrome
    assert_browser_performance($ua['CHROME']) do |browser|
      assert_equal "Chrome", browser.name
      assert browser.chrome?
      refute browser.safari?
      assert browser.webkit?
      assert browser.modern?
      assert_equal "5.0.375.99", browser.full_version
      assert_equal "5", browser.version
    end
  end

  def bench_firefox
    assert_browser_performance($ua["FIREFOX_MODERN"]) do |browser|
      assert_equal :firefox, browser.id
      assert_equal "Firefox", browser.name
      assert browser.firefox?
      assert browser.modern?
      assert_equal "17.0", browser.full_version
      assert_equal "17", browser.version
    end
  end

  def bench_bots
    assert_browser_performance($ua['GOOGLE_BOT']) do |browser|
      assert browser.bot?
      assert_equal browser.bot_name, 'Googlebot'
    end
  end

  private

  def assert_browser_performance ua, &block
    assert_performance(validation_noop) do |n|
      n.times do
        browser = Browser.new ua: ua

        block.call browser
      end
    end
  end

  def validation_noop
    proc { }
  end

end
