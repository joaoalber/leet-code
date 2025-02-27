# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  return [] unless head

  current = head
  prev = nil

  while current
    if current.val == val
      prev ? prev.next = current.next : head = current.next
    else
      prev = current
    end
    
    current = current.next
  end

  head
end
