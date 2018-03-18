require './utilities/my_log'

class FileReader

  def get_username
    MyLog.log.debug 'inside get_username'
    File.open('./utilities/test_data.txt', 'r') do |f|
      f.readline
    end
  end

  def get_password
    MyLog.log.debug 'inside get_password'
    File.open('./utilities/test_data.txt', 'r') do |f|
      f.readline
      f.readline
    end
  end

  def read_data_file
    File.open('.test_data.txt', 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
# File is closed automatically at end of block
  end

end
