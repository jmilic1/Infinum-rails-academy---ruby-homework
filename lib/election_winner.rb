# Implement a function which calculates the winner of an election. Each person's vote is represented
# as a single candidate name. The candidate with the highest number of votes wins the election. In
# case of a tie, when multiple candidates have the same number of votes, they should be sorted
# alphabetically in descending order where last name wins. If Albert and Zach both get 5 votes then
# the winner is Zach.
#
# Eg.
# if votes are ['Paula', 'Zach', 'Albert', 'Zach', 'Paula', 'Albert', 'Albert', 'Zach']
# winner is 'Zach'

def election_winner(votes)
  candidate_votes = Hash.new(0)

  votes.each { |vote| candidate_votes[vote] += 1 }

  max_votes = candidate_votes.values.max
  candidate_votes.select { |_, v| v == max_votes }.sort.reverse[0][0]
end
