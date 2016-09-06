# define user attributes
trainings = [
  { name: 'People'  },
  { name: 'Revenue' },
  { name: 'Impact'  }
]

# idempotently add training categories
trainings.each do |t|
  TrainingCategory.create!(t)
end

# report status
puts "***** seed training categories (#{ TrainingCategory.count }) ***************"
