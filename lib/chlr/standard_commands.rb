# -*- coding: utf-8 -*-

require 'tempfile'

module Chlgr
  class Command
    add :list do |*args|
      output Log.reverse_order(:created_at)
    end

    add :add do
      file = Tempfile.new('chlr')
      system ENV['EDITOR'] || 'vi', file.path
      text = open(file.path).read
      Log << {:text => text, :created_at => Time.now}
    end

    add :search do |*args|
      query = args.first
      output Log.filter(:text.like("%#{query}%")) do |text|
        text = TermColor.escape(text)
        TermColor.parse(text.gsub(query, '<on_yellow><black>\0</black></on_yellow>'))
      end
    end

    add :delete do |*args|
      output Log.filter(:text.like("%#{args.first}%"))
    end

    add :exit do
      exit
    end

    def self.output(dataset, &block)
      puts dataset.limit(10).reverse.map {|log|
        time = log.created_at.strftime("%Y-%m-%d %X")
        header = TermColor.parse("<90>-- [##{log.id}] #{time} --</90>")
        text = block ? block.call(log.text) : log.text
        "#{header}\n#{text}"
      }.join("\n")
    end
  end
end
