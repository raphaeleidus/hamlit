describe Hamlit::Parser::AttributeParser do
  describe '.parse' do
    def assert_hash(string, hash)
      s = StringScanner.new(string)
      expect(described_class.parse(s)).to eq(hash)
    end

    it 'returns an empty hash for a text starting with whitespace' do
      assert_hash(' ', {})
    end

    it 'parses an empty hash' do
      assert_hash(' ', {})
    end

    it 'parses a single-key hash' do
      assert_hash('{foo:"bar"}', { 'foo' => '"bar"' })
      assert_hash('{ foo: "bar" }', { 'foo' => '"bar"' })
      assert_hash('{ foo: 2 }', { 'foo' => '2' })
      assert_hash('{ :foo => 2 }', { 'foo' => '2' })
    end

    it 'parses a multiple-keys hash' do
      assert_hash('{a:"b",c:"d#{e}"}', { 'a' => '"b"', 'c' => '"d#{e}"' })
      assert_hash('{ a: 2, :b => "3"}', { 'a' => '2', 'b' => '"3"' })
    end

    it 'scans balanced hash' do
      line = '{ a: 1, b: { c: 4 } }='
      s = StringScanner.new(line)
      described_class.parse(s)
      expect(s.peek(1)).to eq('=')
    end

    it 'scans balanced hash from internal position' do
      line = "%span{class: 'foo'} bar"
      s = StringScanner.new(line)
      s.scan(/%span/)
      described_class.parse(s)
      expect(s.peek(1)).to eq(' ')
    end
  end
end
