# frozen_string_literal: true

module InterestsHelper
  def checked(area)
    @interest.potentialRoles.nil? ? false : @interest.potentialRoles.match(area)
    @interest.pastWorkExp.nil? ? false : @interest.pastWorkExp.match(area)
  end
end
