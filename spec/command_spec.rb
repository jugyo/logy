# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/spec_helper'

module Chlgr
  describe Command do
    it 'adds command' do
      Command.clear
      Command.add(:foo){}
      Command.get('foo').class.should == Proc
      Command.get('bar').should be_nil
    end

    describe 'add 3 commands' do
      before(:each) do
        Command.clear
        Command.add(:foo1){}
        Command.add(:foo2){}
        Command.add(:bar){}
      end

      it 'search command' do
        commands = Command.search('foo')
        commands.size.should == 2
        commands.include?(:foo1).should == true
        commands.include?(:foo2).should == true
        commands.include?(:bar).should == false
      end
    end
  end
end
