shared_context 'media files' do
  include_context 'database setup'

  before :each do
    media_dir = TMP_TEST_DIR.join('media')

    FileUtils.mkdir_p(media_dir)

    File.open(media_dir.join('some_file.txt'), 'w') do |f|
      f.write('some content')
    end

    File.open(media_dir.join('some_markdown.md'), 'w') do |f|
      f.write('some markdown file')
    end

    File.open(media_dir.join('some_image.png'), 'w') {}
  end
end
