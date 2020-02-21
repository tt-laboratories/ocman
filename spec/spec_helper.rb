# frozen_string_literal: true

require 'ocman'

RSpec.configure do |config|
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

Ocman.configure do |config|
  config.base_url = 'https://example.org'
  config.user_name = 'ocman'
  config.password = 'ocman'
end
