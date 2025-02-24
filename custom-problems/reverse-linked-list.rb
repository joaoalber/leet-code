# Given the head of a singly linked list, reverse the list and return the new head.
# Example:
# Input:
# 1 -> 2 -> 3 -> 4 -> 5 -> NULL
# Output:
# 5 -> 4 -> 3 -> 2 -> 1 -> NULL
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# O(n)
def reverse_linked_list(node, previous = nil)
  return if node.nil?

  reverse_linked_list(node.next, node)
  node.next = previous
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(4)
new_head = head.next.next.next.next = ListNode.new(5)

def print_list(head)
  while head
    print "#{head.val} -> "
    head = head.next
  end
  puts "NULL"
end

print_list(head)
reverse_linked_list(head, previous = nil)
print_list(new_head)
