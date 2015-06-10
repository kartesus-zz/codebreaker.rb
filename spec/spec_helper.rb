RSpec.configure do |config|
  config.mock_with :rspec
  config.warnings = true
  config.order = :random

  Kernel.srand config.seed
end
