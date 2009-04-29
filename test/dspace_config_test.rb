require 'test_helper'

class DspaceConfigTest < Test::Unit::TestCase
  should "set a single key and value from the config file" do
    c = config_parse("foo = bar")
    assert_equal c.length, 1
    assert_equal c['foo'], 'bar'
  end
  
  should "set multiple keys and values from the config file" do
    c = config_parse("foo1 = bar1\nfoo2 = bar2")
    assert_equal c.length, 2
    assert_equal c['foo2'], 'bar2'
  end
  
  should "ignore full comment lines" do
    c = config_parse('# Comment Line')
    assert_equal c.length, 0
  end
  
  should "ignore partial-line comments" do
    c = config_parse('foo = bar # partial line comment')
    assert_equal c.length, 1
    assert_equal c['foo'], 'bar'
  end
  
  should "parse multi-line statements as value arrays" do
    c = config_parse(%{foo = bar, \\\nbaz})
    assert_equal c.length, 1
    assert_equal c['foo'], ['bar', 'baz']
  end
  
  should "parse multi-line statements beginning with a new line (instead of a value)" do
    c = config_parse(%{foo = \\\nbar})
    assert_equal c.length, 1
    assert_equal c['foo'], 'bar'
  end
  
  should "allow '=' characters in a value" do
    c = config_parse('foo = bar = baz')
    assert_equal c.length, 1
    assert_equal c['foo'], 'bar = baz'
  end
  
  should "allow '=' characters in multi-line values" do
    c = config_parse(%{foo = \\\n\tbar = baz, \\\n\tbop = bip})
    assert_equal c.length, 1
    assert_equal c['foo'], ['bar = baz', 'bop = bip']
  end
  
  def config_parse(c)
    Dspace::Config.parse(c)
  end
end
