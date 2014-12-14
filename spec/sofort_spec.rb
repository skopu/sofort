require 'spec_helper'

describe Sofort do
  subject { Sofort::Client.new }

  describe 'Connections with api' do
    it '#pay' do
      expect(subject.pay(10, 'name')).to eq nil
    end
    it '#details' do
      expect(subject.details('token')).to eq nil
    end
  end
end