require 'rspec'
require_relative 'leet_my_linked_list'

describe 'My LL' do
  it 'should initialize a null list' do
    ll = MyLinkedList.new
    expect(ll.list).to eq nil
  end

  it "should add a new head" do
    ll = MyLinkedList.new
    ll.add_at_head 1
    res = ll.get(0)
    expect(ll.list).to eq res
  end


  it "should add a new tail" do
    ll = MyLinkedList.new
    ll.add_at_head 1
    ll.add_at_tail 3
    expect(ll.get(0).val).to eq 1
    expect(ll.get(1).val).to eq 3
  end

  it "should add multiple heads" do
    ll = MyLinkedList.new
    ll.add_at_head 1
    ll.add_at_head 3
    ll.add_at_head 2
    expect(ll.get(0).val).to eq 2
    expect(ll.get(1).val).to eq 3
    expect(ll.get(2).val).to eq 1
  end


  it "should do leet checks properly" do
    # ["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
    # [[],[1],[3],[1,2],[1],[1],[1]]
    # [null,null,null,null,2,null,3]
    ll = MyLinkedList.new
    ll.add_at_head 1
    ll.add_at_tail 3
    ll.add_at_index 1,2
    expect(ll.get(1).val).to eq 2
    ll.delete_at_index 1
    expect(ll.get(1).val).to eq 3
  end
end
