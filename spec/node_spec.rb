require './lib/node'

RSpec.describe Node do
  it 'exists and has attributes' do
    node = Node.new('plop')
    expect(node).to be_instance_of(Node)

    expect(node.data).to      eq('plop')
    expect(node.next_node).to eq(nil)
  end

  describe '#append_data(data)' do
    it 'checks and adds a new node' do
      node = Node.new('plop')

      node.append_data('drop')
      expect(node.next_node.data).to eq('drop')
      expect(node.next_node.next_node).to eq(nil)

      node.append_data('bop')
      expect(node.next_node.data).to eq('drop')
      expect(node.next_node.next_node.data).to eq('bop')
      expect(node.next_node.next_node.next_node).to eq(nil)
    end
  end
end
