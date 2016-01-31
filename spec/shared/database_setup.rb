shared_context 'database setup' do
  let(:configuration) { ROM::Configuration.new(:filesystem, TMP_TEST_DIR).use(:macros) }
  let(:container) { ROM.container(configuration) }
end
