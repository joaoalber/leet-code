# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  return if l1.nil? || l2.nil?

  reversed_l1 = reverse_list(l1).join.to_i
  reversed_l2 = reverse_list(l2).join.to_i

  (reversed_l1 + reversed_l2).digits
end

def reverse_list(list_node, digits = [])
  return digits << list_node.val if list_node.next.nil?

  reverse_list(list_node.next, digits)
  digits << list_node.val
end
