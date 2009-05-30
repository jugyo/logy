Gem::Specification.new do |s|
  s.name = 'logy'
  s.version = '0.1.0'
  s.summary = "Chlr is a Terminal based ChangeLoging tool."
  s.description = "Chlr is a Terminal based ChangeLoging tool."
  s.files = %w( lib/logy/client.rb lib/logy/command.rb lib/logy/log.rb lib/logy/standard_commands.rb lib/logy/version.rb lib/logy.rb
                spec/client_spec.rb spec/command_spec.rb spec/spec_helper.rb
                scripts/console
                README.markdown
                History.txt
                Rakefile )
  s.executables = ["logy"]
  s.add_dependency("sequel", ">= 2.12.0")
  s.add_dependency("termcolor", ">= 1.0.0")
  s.author = 'jugyo'
  s.email = 'jugyo.org@gmail.com'
  s.homepage = 'http://github.com/jugyo/logy'
  s.rubyforge_project = 'logy'
  s.has_rdoc = false
end
