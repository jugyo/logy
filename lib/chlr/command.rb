# -*- coding: utf-8 -*-

module Chlgr
  class Command
    @@commands = {}
    class << self
      def add(name, &block)
        @@commands[name.to_sym] = block
      end

      def get(name)
        @@commands[name.to_sym]
      end

      def search(text)
        return [] if text.nil? || text.empty?
        @@commands.keys.map{|i|i.to_s}.grep(/^#{Regexp.quote(text)}/).map{|i|i.to_sym}
      end

      def find_all
        @@commands
      end

      def clear
        @@commands.clear
      end
    end
  end
end
