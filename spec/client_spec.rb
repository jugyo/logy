# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/spec_helper'

module Chlgr
  describe Client do
    DB_PATH = '/tmp/chlgr.db'
    before do
      File.delete(DB_PATH) if File.exists?(DB_PATH)
    end
    describe 'initialize db' do
      before do
        @client = Client.setup(DB_PATH).new
      end

      it 'should create db file' do
        File.exists?(DB_PATH).should == true
      end

      it 'chould create logs table' do
        Client.db.table_exists?(:logs).should == true
      end

      describe 'add commands' do
        before do
          Command.clear
          Command.add(:foo) {|arg|}
          Command.add(:bar) {|a,b|}
        end

        it 'should call command "foo"' do
          command = Command.get('foo')
          Command.should_receive(:get).with('foo').and_return(command)
          command.should_receive(:call).with('test')
          @client.call_command('foo test')
        end

        it 'should call command "bar"' do
          command = Command.get('bar')
          Command.should_receive(:get).with('bar').and_return(command)
          command.should_receive(:call).with('a', 'b')
          @client.call_command('bar a b')
        end
      end
    end
  end
end
