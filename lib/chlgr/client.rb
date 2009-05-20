# -*- coding: utf-8 -*-

module Chlgr
  class Client
    def self.setup(path)
      @@db = Sequel.sqlite(File.expand_path(path))
      unless @@db.table_exists?(:logs)
        @@db.create_table :logs do
          primary_key :id
          Text :text
          DateTime :created_at
        end
      end
      require 'chlgr/log'
      self
    end

    def self.db
      @@db
    end

    def self.start
      self.new.start
    end

    def start
      Readline.basic_word_break_characters= "\t\n\"\\'`><=;|&{("
      Readline.completion_proc = lambda do |text|
        Command.search(text)
      end

      while buf = Readline.readline('> ', true)
        call_command(buf)
      end
    end

    def call_command(text)
      cmd, *args = text.split(/\s/)
      Command.get(cmd).call(*args)
    end
  end
end
