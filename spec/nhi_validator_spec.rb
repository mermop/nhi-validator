require 'nhi-validator'

describe NHIValidator do
  let(:valid_nhis) { %w[ZZZ0016 zzz0024 CGC2720 EPT6335] }
  let(:invalid_nhis) { %w[ZZI0293 ZZO0023 ZZZ0044 DAB8233] }

  it 'returns true for valid nhis' do
    valid_nhis.each do |number|
      expect(NHIValidator.valid?(number)).to eq(true)
    end
  end

  it 'returns true for valid nhis' do
    invalid_nhis.each do |number|
      expect(NHIValidator.valid?(number)).to eq(false)
    end
  end
end
