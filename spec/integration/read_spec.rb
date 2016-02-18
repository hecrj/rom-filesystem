require 'spec_helper'

describe 'Reading relations' do
  include_context 'media files'

  before :each do
    configuration.relation(:media) do
      register_as :media
      dataset { sort }

      def text_files
        select('*.txt')
      end
    end
  end

  let(:media) { container.relation(:media) }

  it 'lists file paths' do
    paths = media.to_a.map { |file| file[:path] }

    expect(paths).to eql([
                           Pathname.new(TMP_TEST_DIR).join('media/some_file.txt'),
                           Pathname.new(TMP_TEST_DIR).join('media/some_image.png'),
                           Pathname.new(TMP_TEST_DIR).join('media/some_markdown.md')
                         ])
  end

  it 'lists file names' do
    names = media.to_a.map { |file| file[:name] }

    expect(names).to eql(%w(some_file.txt some_image.png some_markdown.md))
  end

  it 'selects files' do
    files = media.text_files.to_a.map { |file| file[:name] }

    expect(files).to eql(%w(some_file.txt))
  end
end
