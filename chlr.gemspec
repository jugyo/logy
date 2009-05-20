Gem::Specification.new do |s|
  s.name = 'chlr'
  s.version = '0.0.1'
  s.summary = "Chlr is a Terminal based ChangeLoging tool."
  s.description = "Chlr is a Terminal based ChangeLoging tool."
  s.files = %w( lib/chlr/client.rb lib/chlr/command.rb lib/chlr/log.rb lib/chlr/standard_commands.rb lib/chlr/version.rb lib/chlr.rb
                spec/client_spec.rb spec/command_spec.rb spec/spec_helper.rb
                scripts/console
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
