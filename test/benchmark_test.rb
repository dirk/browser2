require 'test_helper'

require 'benchmark'
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

  WARMUP        = 1_000
  ITERATIONS    = 10_000
  GC_ITERATIONS = 1_00

  def assert_browser_performance ua, &test_block
    block = proc do
      browser = Browser.new ua: ua

      test_block.call browser
    end

    WARMUP.times &block

    time = Benchmark.realtime do
      ITERATIONS.times &block
    end

    objects = benchmark_memory &block

    print "#{name}\t%10.5f seconds\t%d objects\n" % [time, objects]
  end

  def validation_noop
    proc { }
  end

  def benchmark_memory &block
    GC.start

    before_allocated = GC.stat[:total_allocated_objects]
    GC.disable

    GC_ITERATIONS.times &block

    after_allocated = GC.stat[:total_allocated_objects]
    GC.enable

    return after_allocated - before_allocated
  end

end
