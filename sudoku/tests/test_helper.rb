def assert boolean, message=nil
  raise message unless boolean
end

def assert_equals x, y
  assert(x == y, "Expected #{x} but got #{y} instead")
end
