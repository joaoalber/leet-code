# given a hash within N nested hashes, create a method to return how many levels of hash
# it has

brands = {
  samsung: {
    since: "1995",
    latest_events: {
      name: "hall of the fame",
      date: {
        day: "05",
        month: "12"
      }
    },
    galaxy: {
      mobile: {
        name: "S24 Ultra"
      }
    }
  },
  xiaomi: {
    since: "2005",
    latest_events: {
      name: "hall of the fame",
      date: {
        day: "05",
        month: "12"
      }
    },
    poco: {
      mobile: {
        name: "X3"
      }
    }
  }
}

def count_nested_hash(hash, counter)  
  hash.each do |k, v|
    if v.is_a?(Hash)
      counter = count_nested_hash(v, counter + 1)
    end
  end

  counter
end

puts count_nested_hash(brands, 0)
