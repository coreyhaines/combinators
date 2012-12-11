thrush = ->(proc1) do
  ->(proc2) {
    ->(val) {
      proc2.to_proc.(proc1.to_proc.(val))
    }
  }
end


# Thrush

thrush.call(->(x){x*2}).call(->(x){ x + 1}).(3) == 7 or raise "thrush should call in reverse order"
STDOUT << "."


# can store the combination and apply later
times_2 = ->(x) { x * 2 }
plus_2 = ->(x) { x + 2 }
times_2_then_plus_2 = thrush.call(times_2).call(plus_2)

times_2_then_plus_2.(5) == 12 or raise "thrush should allow for storing combination for later application"
STDOUT << "."

STDOUT << "\n"
