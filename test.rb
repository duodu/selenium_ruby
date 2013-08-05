puts <<BEGIN + "<--- middle --->\n" + <<END
  This is the beginning:
BEGIN
  And now it is over!
END



require 'pathname'

 

#获得当前执行文件的完整路径
puts Pathname.new(__FILE__).realpath

#获得当前执行文件的目录完整路径

puts Pathname.new(File.dirname(__FILE__)).realpath
puts File.dirname(__FILE__)

Kernel.send "Array", "mystring"

puts mystring.class
