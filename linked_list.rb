# linked-all
class LinkedList
  attr_accessor :name
  attr_reader :head, :tail

  # NODE DEF
  class Node
    attr_accessor :prev, :data, :next

    def initialize(data = nil)
      @data = data
      @next = nil
    end
  end

  # LIST METHODS
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    temp = @head
    temp = temp.next until temp.next.nil?
    temp.next = Node.new(value)
    @tail = temp.next
  end

  def prepend(value)
    return @head = Node.new(value) if @head.nil?

    temp = @head
    @head = Node.new(value)
    @head.next = temp
  end

  def size
    index = 0
    temp = @head
    until temp.next.nil?
      temp = temp.next
      index += 1
    end
    index
  end

  def at(index_gap)
    return nil if index_gap.negative?

    index = 0
    temp = @head
    until index >= index_gap
      break if temp.nil?

      temp = temp.next
      index += 1
    end
    temp
  end

  def pop
    return nil if @head.nil?

    if @head.next.nil?
      @tail = nil
      return @head = nil
    end
    at(size - 1).next = nil
    return @tail = at(size) unless size.zero?

    @tail = nil
  end

  def contains?(value)
    bool = false
    temp = @head
    until temp.nil?
      return bool = true if temp.data == value

      temp = temp.next
    end
    bool
  end

  def find(value)
    index = 0
    temp = @head
    until temp.nil?
      return index if temp.data == value

      index += 1
      temp = temp.next
    end
    nil
  end

  def to_s
    arr = []
    temp = @head
    until temp.nil?
      arr.push("( #{temp.data} )")
      temp = temp.next
    end
    arr.push('( nil )')
    arr.join(' -> ')
  end

  def insert_at(value, index)
    temp = at(index-1)
    post_temp = at(index)
    added = Node.new(value)
    added.next = post_temp
    temp.next = added
  end

  def remove_at(index)
    temp = at(index - 1)
    post_temp = at(index + 1)
    temp.next = post_temp
  end
end

link = LinkedList.new
link.append('xd')
link.prepend('dx')
link.append(3)
link.append(2)
link.append(1)
p link.size
p link.at(5)
p 'contiene mango?'
p link.to_s
p link.contains?('mango')
link.insert_at('mango', 1)
p link.to_s
p 'contiene mango?'
p link.contains?('mango')
p 'donde mango?'
p link.find('mango')
link.remove_at(1)
p link.to_s