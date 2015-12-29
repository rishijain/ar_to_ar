require File.expand_path("../../test/test_helper", __FILE__)
require "fileutils"

class ArToArTest < Minitest::Test

  def setup
    @runner = ArToAr::ActiveRecordToApplicationRecord.new "#{Dir.pwd}/test/fixtures"
    @runner.start!
  end

  def test_that_it_has_a_version_number
    refute_nil ::ArToAr::VERSION
    revert_files
  end

  def test_if_application_record_gets_generated
    assert true, File.exists?("#{Dir.pwd}/test/fixtures/app/models/application_record.rb")
    revert_files
  end

  def test_if_activerecord_is_replaced_with_applicationrecord
    line = File.open("#{Dir.pwd}/test/fixtures/app/models/user.rb", "r++") do |file|
      file.find { |line| line.match /(class(.+)<\s*ApplicationRecord)/ }
    end
    assert line, "class User < ApplicationRecord\n"
    revert_files
  end

  private

  def revert_files
    FileUtils.cp "#{Dir.pwd}/test/fixtures/backups/user.rb", "#{Dir.pwd}/test/fixtures/app/models/user.rb"
    File.delete "#{Dir.pwd}/test/fixtures/app/models/application_record.rb"
  end

end
