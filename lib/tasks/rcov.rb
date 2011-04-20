desc  "Run all specs with rcov"

RSpec::Core::RakeTask.new("rcov") do |t|
  t.rcov = true
  t.rcov_opts = %w{--rails -Ispec --exclude /Library,.bundle,config,spec,lib,features,.rvm}
end