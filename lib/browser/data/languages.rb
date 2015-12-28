class Browser
  module Data
    LANGUAGES = MultiJson.load File.read(File.expand_path('../../../../data/languages.json', __FILE__))
  end
end
