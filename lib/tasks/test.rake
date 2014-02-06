task :test do 
  system "bundle exec rspec spec"
  system "bundle exec cucumber"
end

require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_and_push_coverage => [:test, 'coveralls:push']
