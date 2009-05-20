$:.unshift File.dirname(__FILE__) + '/lib/'
require 'chlr'
require 'spec/rake/spectask'

desc 'run all specs'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['-c']
end

desc 'Generate gemspec'
task :gemspec do |t|
  open('chlr.gemspec', "wb" ) do |file|
    file << <<-EOS
Gem::Specification.new do |s|
  s.name = 'chlr'
  s.version = '#{Chlr::VERSION}'
  s.summary = "Chlr is a Terminal based ChangeLoging tool."
  s.description = "Chlr is a Terminal based ChangeLoging tool."
  s.files = %w( #{Dir['lib/**/*.rb'].join(' ')}
                #{Dir['spec/**/*.rb'].join(' ')}
                #{Dir['scripts/*'].join(' ')}
                README.markdown
                History.txt
                Rakefile )
  s.executables = ["chlr"]
  s.add_dependency("sequel", ">= 2.12.0")
  s.add_dependency("termcolor", ">= 1.0.0")
  s.author = 'jugyo'
  s.email = 'jugyo.org@gmail.com'
  s.homepage = 'http://github.com/jugyo/chlr'
  s.rubyforge_project = 'chlr'
  s.has_rdoc = false
end
    EOS
  end
  puts "Generate gemspec"
end

desc 'Generate gem'
task :gem => :gemspec do |t|
  system 'gem', 'build', 'chlr.gemspec'
end
