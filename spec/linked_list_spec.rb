require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  it 'exists and has attributes' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
    expect(list.head).to eq(nil)
  end

  describe '#append' do
    it 'adds a new piece of data to the list' do
      list = LinkedList.new

      list.append('doop')
      expect(list.head).to be_instance_of(Node)
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to eq(nil)

      list.append("deep")
      expect(list.head.data).to eq('doop')
      expect(list.head.next_node.data).to eq('deep')
      expect(list.head.next_node.next_node).to eq(nil)
    end
  end

  describe '#count' do
    it 'tells us how many things are in the list' do
      list = LinkedList.new

      list.append('doop')
      expect(list.count).to eq(1)

      list.append('deep')
      expect(list.count).to eq(2)
    end
  end

  describe '#to_string' do
    it 'generates a string of all elements seperated by a space' do
      list = LinkedList.new

      list.append('doop')
      expect(list.to_string).to eq('doop')

      list.append('deep')
      expect(list.to_string).to eq('doop deep')
    end
  end

  describe '#prepend' do
    it 'adds nodes to the beginning of the list' do
      list = LinkedList.new
      list.append('plop')
      expect(list.to_string).to eq('plop')

      list.append('suu')
      list.prepend('dop')
      expect(list.to_string).to eq('dop plop suu')
      expect(list.count).to eq(3)
    end
  end

  describe '#insert(position, data)' do
    it 'inserts one or more elements at a given position' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')

      list.insert(1, 'woo')
      expect(list.to_string).to eq('dop woo plop suu')
    end
  end

  describe '#find(position, length)' do
    it 'finds data by elements and length of how many' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      found = list.find(2, 1)
      expect(found).to eq('shi')

      found = list.find(1, 3)
      expect(found).to eq('woo shi shu')
    end
  end

  describe '#includes?' do
    it 'tells whether the supplied value is in the list' do
      list = LinkedList.new
      list.append('deep')
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.append('blop')

      expect(list.includes?('dep')).to eq(false)
      expect(list.includes?('deep')).to eq(true)
    end
  end
end


# list.pop
# ="blop"
# list.pop
# ="shu"
# list.to_string
# ="deep woo shi"
