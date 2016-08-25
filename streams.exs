defmodule EnumStreams do

  import File

@doc """
Using large_lines!/1 as a model, write the following function:

 lines_lengths!/1 that takes a file path and returns a list of numbers, with each
number representing the length of the corresponding line from the file.
 longest_line_length!/1 that returns the length of the longest line in a file.
 longest_line!/1 that returns the contents of the longest line in a file.
 words_per_line!/1 that returns a list of numbers, with each number representing
the word count in a file. Hint: to get the word count of a line, use
length(String.split(line)).

def large_lines!(path) do
File.stream!(path)
|> Stream.map(&String.replace(&1, "\n", ""))
|> Enum.filter(&(String.length(&1) > 80))
end

"""

  def lines_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&(String.length(&1)))
    |> Enum.each(&(IO.puts "#{&1}"))
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&(String.length(&1)))
    |> Enum.max
  end

  def longest_line!(path) do
    File.stream!(path)
    |> Stream.map(&(Enum.max(Stream.map(&(String.length(&1)))) IO.puts "#{&1} tiene ", IO.puts String.length(&1)))
    |> Enum.each

  end

end
