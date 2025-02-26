class LRUCache
  Node = Struct.new(:key, :value, :prev, :next)

  def initialize(capacity)
    @capacity = capacity
    @cache = {}
    @head = Node.new(nil, nil, nil, nil)
    @tail = Node.new(nil, nil, nil, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def print_list
    node = @head.next

    while node != @tail
      puts "Key: #{node.key}, Value: #{node.value}"
      node = node.next
    end
  end

  def get(key)
    node = @cache[key]
    return unless node

    remove_node(node)
    add_to_most_recent(node)
    node.value
  end

  def put(key, value)
    if node = @cache[key]
      node.value = value
      remove_node(node)
      add_to_most_recent(node)
    else
      delete_least_used if @cache.size == @capacity
      node = Node.new(key, value, nil, nil)
      @cache[key] = node
      add_to_most_recent(node)
    end
  end

  private

  def add_to_most_recent(node)
    remove_node(node) if node.next || node.prev

    node.next = @head.next
    node.prev = @head
    @head.next.prev = node
    @head.next = node
  end

  def remove_node(node)
    node.prev.next = node.next if node.prev
    node.next.prev = node.prev if node.next
  end

  def delete_least_used
    lru_node = @tail.prev
    @cache.delete(lru_node.key)
    remove_node(lru_node)
  end
end

lru_cache = LRUCache.new(4)
lru_cache.put("a", 2)
lru_cache.put("b", 3)
lru_cache.put("c", 4)
lru_cache.put("d", 5)
lru_cache.put("e", 6) # This will evict "a"
lru_cache.print_list
