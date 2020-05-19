
class Node
  
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end


class LinkedList
  attr_accessor :head, :tail

  def initialize()
    @head = nil
    @tail = nil
  end

#prepend(value) adds a new node containing value to the start of the list  
  def prepend(value)
  if @head
    newHead = Node.new(value)
    oldHead = @head
    @head = newHead
    @head.next_node = oldHead
  else
    @head = Node.new(value)
  end
  end

#append(value) adds a new node containing value to the end of the list
  def append(value)
    if @tail
      newtail = Node.new(value)
      @tail.next_node = newtail
      @tail = newtail
    elsif @head
      @tail = Node.new(value)
      @head.next_node = @tail
    else
      @tail = Node.new(value)
      @head = Node.new(value)
    end
  end

#size returns the total number of nodes in the list  
  def size()
    if @head && @tail
      node = @head
      counter = 1
      while node.next_node != nil
          counter += 1
          node = node.next_node
      end
      return counter
    elsif @head
      counter = 1
    else
      counter = 0
    end
  end

#head returns the first node in the list  
  def head()
    return @head
  end

#tail returns the last node in the list  
  def tail()
    return @tail
  end

#at(index) returns the node at the given index  
  def at(index)
    i = 0
    node = @head
    while i < index
      if node.next_node == nil
        return node
      else
        i += 1
        node = node.next_node
      end 
    end
    return node
  end

 #pop removes the last element from the list 
  def pop()
    len = self.size() - 1
    newTail = self.at(len-1)
    @tail = newTail
    @tail.next_node = nil
  end

#contains?(value) returns true if the passed in value is in the list and otherwise returns false.  
  def contains?(value)
    node = @head
    i = 0
    while i < self.size
      if node.value == value
        return true
      elsif node.next_node == nil
        return false
      else
        node = node.next_node
      end
      i+=1
    end
  end

#find(value) returns the index of the node containing value, or nil if not found.  
  def find(value)
    if self.contains?(value)
      node = @head
      i = 0
      while i < self.size
        if node.value == value
          return i  
        else
          node = node.next_node
        end
      i+=1
      end
    end
  end  

#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console.   
  def to_s
    i = 0
    node = @head
    while i < self.size
      print "(#{node.value}) -->"
      node = node.next_node
      i+=1
    end
  end

#insert_at(value, index) that inserts the node with the provided value at the given index
  def insert_at(value,index)
    before = self.at(index-1)
    after = self.at(index)
    newnode = Node.new(value)
    before.next_node = newnode
    newnode.next_node = after
  end
  
#remove_at(index) that removes the node at the given index. 
  def remove_at(index)
    before = self.at(index-1)
    after = self.at(index+1)
    removal = self.at(index)
    removal.next_node = nil
    before.next_node = after
  end



end



list = LinkedList.new

list.prepend(30)
list.append(10)
list.append(20)
list.append(100)


puts list.to_s

list.remove_at(1)

puts list.to_s