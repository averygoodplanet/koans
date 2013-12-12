require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    # Append—Pushes the given object on to the end of this array.
    # e.g. array<<5  adds 5 to the end of the array.
    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
   # Most symbols looks like a colon followed by a non-quoted string e.g. :myname
   #http://www.troubleshooters.com/codecorn/ruby/symbols.htm
   #Symbols are immutable. Their value remains constant during the entirety of the program.
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    #array.first gives first item in array, aka 0th index
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    #array.last gives last item in array, aka -1th index
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    #slice(start, length) → new_ary or nil
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    #if length is greater than ending item, stops at ending item in array
    assert_equal [:and, :jelly], array[2,20]
    #if the start index given is greater than array.last, then returns empty array
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    #if array[x,0] where x is greater than array.last, then returns nil
    #where x is less than or equal to array.last, then returns empty array
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    # Range is an interval
    # (1..3) .to_a is [1,2,3]
    # with three dots excludes last
    # e.g. (1...3).to_a is [1,2]
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    #notice the 3 dots instead of 2
    assert_equal [:peanut, :butter], array[0...2]
    # if you do array[2..-1] means go from 2nd index to -1th index
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1,2,:last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    #unshift will add a new item to the beginning of an array.
    array.unshift(:first)

    assert_equal [:first, 1, 2], array
    #To retrieve and at the same time remove the first item, use shift.
    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end

end
