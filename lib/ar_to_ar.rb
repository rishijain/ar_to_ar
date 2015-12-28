require "ar_to_ar/version"

module ArToAr
  class ActiveRecordToApplicationRecord

    def initialize
      @current_path = Dir.pwd
      @all_file_names = Dir["#{@current_path}/app/models/*.rb"]
    end

    def start!
      @all_file_names.each do |file_name|
        matched_line = new_line = nil
        matched_line = find_matched_line file_name
        next if matched_line.nil?
        model_name = find_model_name matched_line
        new_content = get_new_content model_name
        replace_content file_name, matched_line, new_content
      end
    end

    private

    #this method finds the line in app/models/*.rb which matches
    #class ModelName < ActiveRecord::Base
    def find_matched_line(file_path)
      File.open(file_path, "r++") do |file|
        return file.find { |line| line.match /(class(.+)<\s*ActiveRecord::Base)/ }
      end
    end

    #line_of_interest is basically line of format
    #class ModelName < ActiveRecord::Base
    #this gets returned by find_matched_line method
    def find_model_name line_of_interest
      model_name = line_of_interest.split('class ').last.split('<')[0]
      model_name = model_name.strip if model_name
      model_name
    end

    def get_new_content model_name
      "class #{model_name} < ApplicationRecord\n"
    end

    def replace_content file_path, old_content, new_content
      file_text = File.read file_path
      sub_content = file_text.gsub old_content, new_content
      File.open(file_path, "w") {|file| file.puts sub_content}
    end
  end
end
