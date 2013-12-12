require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutNil < Neo::Koan
  def test_nil_is_an_object
    # eveything in Ruby is an object http://lukaszwrobel.pl/blog/ruby-is-nil
    # nil is an object of class NilClass
    # therefore:
    # nil.is_a?(Object) => true
    # nil.class => NilClass
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?  exception of class NoMethodError
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # some_method_nil_doesnt_know_about
      # assert_match(pattern, string, message="")
      assert_match(/some_method_nil_doesnt_know_about/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    # Only the object nil responds true to nil?
    assert_equal true, nil.nil?
    # .to_s returns a string
    assert_equal "", nil.to_s
    # .inspect returns a string containing a human-readable representation of obj.
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    # It appears that x = nil  =.> nil
    # and x.nil? => true
  end

end
