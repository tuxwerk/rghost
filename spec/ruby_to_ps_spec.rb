require File.expand_path(File.join(File.dirname(__FILE__),'spec_helper'))

include RGhost::RubyToPs

describe RGhost::RubyToPs do

  it "should escape '(' parens" do
    to_string("(").should == "(\\() "
  end

  it "should escape ')' parens" do
    to_string(")").should == "(\\)) "
  end
  
  it "should escape a backslash" do
    to_string("\\").should == "(\\\\) "
  end

  it "should convert umlauts to latin" do
    to_string("äüößÖÄÜ").should == "(\344\374\366\337\326\304\334) "
  end

  it "should convert umlauts with parens to latin" do
    to_string("äüöß)ÖÄÜ").should == "(\344\374\366\337\\)\326\304\334) "
  end

end

