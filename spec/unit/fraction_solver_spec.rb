require File.dirname(__FILE__) + '/../spec_helper'

describe Stater::FractionSolver do
  describe 'simplify' do
    it 'works' do
      solver = Stater::FractionSolver.new
      expect(solver.solve('4 1/4 + 1 1/2')).to eq 23/4r
    end
  end
end
