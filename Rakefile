require 'spec/rake/spectask'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'

name = 'logy'
version = '0.2.0'

spec = Gem::Specification.new do |s|
  s.name = name
  s.version = version
  s.summary = "Logy is a Terminal based ChangeLoging tool."
  s.description = "Logy is a Terminal based ChangeLoging tool."
  s.files = %w(Rakefile README.markdown History.txt) + Dir.glob("{lib,spec,scripts}/**/*")
  s.executables = ["logy"]
  s.add_dependency("sequel", ">= 2.12.0")
  s.add_dependency("termcolor", ">= 1.0.0")
  s.author = 'jugyo'
  s.email = 'jugyo.org@gmail.com'
  s.homepage = 'http://github.com/jugyo/logy'
  s.rubyforge_project = 'logy'
  s.has_rdoc = false
end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true
end

task :install => [ :package ] do
  sh %{sudo gem install pkg/#{name}-#{version}.gem}
end

task :uninstall => [ :clean ] do
  sh %{sudo gem uninstall #{name}}
end

desc 'run all specs'
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
end

Rake::RDocTask.new do |t|
  t.rdoc_dir = 'rdoc'
  t.title    = "rest-client, fetch RESTful resources effortlessly"
  t.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  t.options << '--charset' << 'utf-8'
  t.rdoc_files.include('README.markdown')
  t.rdoc_files.include('lib/logy.rb')
  t.rdoc_files.include('lib/logy/*.rb')
end

CLEAN.include [ 'pkg', '*.gem' ]
