Thrush = ->(proc1) do
  ->(proc2) {
    ->(val) {
      proc2.to_proc.(proc1.to_proc.(val))
    }
  }
end

def test msg = "FAILURE", &conditions
  yield or raise msg
  STDOUT << "."
end

# Thrush

test "thrush should call in reverse order" do
  Thrush.call(->(x){x*2}).call(->(x){ x + 1}).(3) == 7
end



# can store the combination and apply later
test "thrush should allow for storing combination for later application" do
  times_2 = ->(x) { x * 2 }
  plus_2 = ->(x) { x + 2 }
  times_2_then_plus_2 = Thrush.call(times_2).call(plus_2)

  times_2_then_plus_2.(5) == 12
end

STDOUT << "\n"
