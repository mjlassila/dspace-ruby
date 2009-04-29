require File.dirname(__FILE__)+'/../lib/dspace/config'
require 'spec'

describe Dspace::Config do
  it "should set a single key and value from the config file" do
    c = config_parse("foo = bar")
    c.length.should == 1
    c['foo'].should == 'bar'
  end
  
  it "should set multiple keys and values from the config file" do
    c = config_parse("foo1 = bar1\nfoo2 = bar2")
    c.length.should == 2
    c['foo2'].should == 'bar2'
  end
  
  it "should ignore full comment lines" do
    c = config_parse('# Comment Line')
    c.length.should == 0
  end
  
  it "should ignore partial-line comments" do
    c = config_parse('foo = bar # partial line comment')
    c.length.should == 1
    c['foo'].should == 'bar'
  end
  
  it "should parse multi-line statements as value arrays" do
    c = config_parse(%{foo = bar, \\\nbaz})
    c.length.should == 1
    c['foo'].should == ['bar', 'baz']
  end
  
  it "should parse multi-line statements beginning with a new line (instead of a value)" do
    c = config_parse(%{foo = \\\nbar})
    c.length.should == 1
    c['foo'].should == 'bar'
  end
  
  it "should allow '=' characters in a value" do
    c = config_parse('foo = bar = baz')
    c.length.should == 1
    c['foo'].should == 'bar = baz'
  end
  
  it "should allow '=' characters in multi-line values" do
    c = config_parse(%{foo = \\\n\tbar = baz, \\\n\tbop = bip})
    c.length.should == 1
    c['foo'].should == ['bar = baz', 'bop = bip']
  end
end

def config_parse(c)
  Dspace::Config.parse(c)
end