input = File.read("INPUT")
output = ""
lines = input.split("\n").reject{|line| line.empty?}

output = %{quiz_1 = Quiz.create(:name => "#{lines[0]}")
quiz_1.questions.create(:content => "#{lines[1]}")
}

# lol this is so ugly
lines[2..5].each do |line|
  if line[-2..-1] == "**"
    output << %{quiz_1.questions.build(:content => "#{line[1..-3]}", :correct => true)\n}
  else
    output << %{quiz_1.questions.build(:content => "#{line[1..-1]}")\n}
  end
end
output << %{quiz_1.save}


# overwrites that file with the contents of the "output" string
File.open("seeds.rb", "w") { |file| file.write output }