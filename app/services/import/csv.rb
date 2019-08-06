module Import
  class Csv
    extend ServiceObject

    def initialize(filepath: Rails.public_path.join('revolut.csv'))
      @filepath = filepath
    end

    def call
    end

    private

    attr_reader :filepath

    def parsed_csv
      @parsed_csv ||= SmarterCSV.process(filepath, col_sep: ';')
    end
  end
end
