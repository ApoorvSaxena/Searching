#ARGV used for command-line arguments input

# Used for getting the path of Current Working Directory
require "pathname"

# For making a temporary file instead of working upon the original file
# so that other processes can continue their work
# Had some problem in using it...
#require "tempfile"

# To search for all files and files in sub-directories present in side the
# working directory 
require "find" 

# Method searching the string inside the file
def scanning(file, string)
	count = 0
	File.foreach(file) do |line|
		 count += line.scan(/#{string}/).count
	end
	p "File: " + file + " : " + count.to_s
end

# Used in case Input is not passed in the command-line
def take_input
	p "Enter the String to be searched: "
	input = gets.chomp
end

# Get path of the current working directory
path = Pathname.getwd

# String to be searched is Input
string = if (ARGV.to_s.empty?)
	 					take_input
				 else
						 string = ARGV.to_s
				 end


# Find every file present in the current directory and sub-directories
# and execute the functioning of scanning in the file
Find.find("", "#{path}") do |file|
 if File.file?(file)
		scanning(file, string)
 end
end
