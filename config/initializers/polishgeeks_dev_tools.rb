if %w(test development).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.rubycritic = false
    config.yml_parser = false
    config.examples_comparator = false
    config.brakeman = false
    config.haml_lint = false
    config.rspec_files_structure = false
    config.simplecov = false
    config.simplecov_threshold = false
    config.yard = false
  end
end
