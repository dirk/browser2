# frozen_string_literal: true

class Browser
  module Bots
    BOTS           = Browser::Data::BOTS
    SEARCH_ENGINES = Browser::Data::SEARCH_ENGINES

    def self.detect_empty_ua!
      @detect_empty_ua = true
    end

    def self.detect_empty_ua?
      !!@detect_empty_ua
    end

    def bot?
      bot_with_empty_ua? || BOTS.any? {|key, _| ua.include?(key) }
    end

    def bot_name
      return 'Generic Bot' if bot_with_empty_ua?

      pair = BOTS.find {|key, _| ua.include?(key) }
      return pair ? pair.first : nil
    end

    def search_engine?
      SEARCH_ENGINES.any? {|key, _| ua.include?(key) }
    end

    private

    def bot_with_empty_ua?
      Browser::Bots.detect_empty_ua? && ua.strip == ''
    end
  end
end
