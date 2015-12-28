class Browser
  module Data
    BOTS = MultiJson.load File.read(File.expand_path('../../../../data/bots.json', __FILE__))
  end
end
