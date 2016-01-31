require 'spec_helper'

describe 'Reading relations' do
  include_context 'media files'

  before :each do
    configuration.relation(:media) do
      register_as :media
    end

    configuration.mappers do
      define(:files) do
        relation :media
        register_as :files

        model File
      end
    end
  end

  it 'lists files' do
    media = container.relation(:media)

    expect(media.sort.to_a).to eql([
                                     Pathname.new(TMP_TEST_DIR).join('media/some_file.txt'),
                                     Pathname.new(TMP_TEST_DIR).join('media/some_image.png'),
                                     Pathname.new(TMP_TEST_DIR).join('media/some_markdown.md')
                                   ])
  end

  it 'selects files' do
    media = container.relation(:media)

    expect(media.select('*.txt', '*.png').sort.to_a).to eql([
                                                              Pathname.new(TMP_TEST_DIR).join('media/some_file.txt'),
                                                              Pathname.new(TMP_TEST_DIR).join('media/some_image.png')
                                                            ])
  end

  it 'can map to files' do
    media = container.relation(:media)

    expect(media.as(:files).sort.to_a.map(&:read)).to eql([
                                                            'some content',
                                                            '',
                                                            'some markdown file'
                                                          ])
  end
end
