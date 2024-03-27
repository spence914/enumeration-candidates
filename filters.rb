# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'


def find(candidates, id)
    candidates.find { |candidate| candidate[:id] == id }
  end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end

  def git100?(candidate)
    candidate[:github_points] >= 100
  end

  def python_or_ruby?(candidate)
   candidate[:languages].include?('Python') || candidate[:languages].include?('Ruby')
  end

  def applied_recently?(candidate)
   candidate[:date_applied] > 15.days.ago.to_date
  end

  def old_enough?(candidate)
    candidate[:age] > 17
  end
  
  def qualified_candidates(candidates)
    candidates.filter do |candidate|
      python_or_ruby?(candidate) && 
      applied_recently?(candidate) &&
      experienced?(candidate) && 
      git100?(candidate) && 
      old_enough?(candidate)
    end
  end
  
  def ordered_by_qualifications(candidates)
    sorted_candidates = candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end


