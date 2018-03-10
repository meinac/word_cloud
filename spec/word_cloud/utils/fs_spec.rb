require 'spec_helper'

RSpec.describe WordCloud::Utils::FS do
  let(:dummy_path) { fixture_path('dummy_dir') }

  describe '::list' do
    it 'return the list of the files' do
      expected_list = ['bar.txt', 'foo.txt']
      files = described_class.list(dummy_path)

      expect(files).to eql(expected_list)
    end
  end

  describe '::join' do
    it 'joins given strings to create absolute path' do
      joined_string = described_class.join('foo', 'bar')

      expect(joined_string).to eql('foo/bar')
    end
  end

  describe '::run_in_path' do
    let(:test_file) { fixture_path('dummy_dir', 'test_run_in_path') }

    it 'executes given block in given path' do
      begin
        expect {
          described_class.run_in_path(dummy_path) { `touch #{test_file}` }
        }.to change { `ls #{dummy_path}` }
      ensure
        `rm #{test_file}`
      end
    end
  end

end
