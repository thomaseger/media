require 'simplecov'

SimpleCov.start do
  add_filter "/spec"
  add_filter "/features"
  add_filter "/vendor"
end
