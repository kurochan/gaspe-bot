require 'clockwork'

module Clockwork
  handler do |job|
    job.call
  end
end
