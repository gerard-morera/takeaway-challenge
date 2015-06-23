require 'customer'

describe Customer do

  let(:order_processor) { double(:order_processor) }

  it 'takes an order' do
    customer = Customer.new order_processor: order_processor

    expect(order_processor).to receive(:process).with 'potatoes: 1, carrots: 2, price: 10'
    
    customer.take_order('potatoes: 1, carrots: 2, price: 10')
  end

end # make it pass!
