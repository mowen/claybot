require 'test/unit'
require 'shoulda'

require File.join(File.dirname(__FILE__), 'sheeeiiit')

class TestSheeeiiit < Test::Unit::TestCase
  context "a sheeeiiit" do
    
    setup do
      @sheeeiiit = Sheeeiiit.generate
    end

    should "not exceed the 128 characters" do
      assert @sheeeiiit.length <= 128, @sheeeiiit 
    end

    should "have at least 5 of each letter" do
      assert @sheeeiiit.count('e') >= 5, @sheeeiiit 
      assert @sheeeiiit.count('i') >= 5, @sheeeiiit 
    end    

    should "have no more than 15 of each letter" do
      assert @sheeeiiit.count('e') <= 15, @sheeeiiit 
      assert @sheeeiiit.count('i') <= 15, @sheeeiiit
    end

  end
end
