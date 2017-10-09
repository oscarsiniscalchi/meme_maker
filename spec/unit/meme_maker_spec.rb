require 'byebug'
require 'vcr'

describe MemeMaker do
  after :all do
    FileUtils.rm_rf Dir[File.expand_path('temp/*.image')]
    FileUtils.rm_rf Dir[File.expand_path('output/*.png')]
  end

  it 'exists' do
    expect(MemeMaker).to be
  end

  describe '#generate' do
    let(:meme_url)  { 'http://lorempixel.com/800/1600/sports/' }
    let(:header)    { 'This is just a test' }
    let(:subheader) { 'But it works' }

    it 'requires 3 parameters' do
      expect{
        MemeMaker.generate(meme_url, header, subheader)
      }.not_to raise_error
    end

    it 'returns a url string' do
      expect(MemeMaker.generate(meme_url, header, subheader)).to be_a(String)
    end

    it 'downloads the image for processing' do
      expect{
        MemeMaker.generate(meme_url, header, subheader)
      }.to change{ Dir[File.expand_path('temp/**/*.png')].count }.by(1)
    end

    it 'resizes the image' do
    end
  end
end
