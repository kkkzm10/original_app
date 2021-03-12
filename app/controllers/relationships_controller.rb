class RelationshipsController < ApplicationController
  def create
    binding.pry
    current_user.active_relationships.create(create_params)
  end

  private

  def create_params
    params.require(:relationship).permit(:following_id).merge(follower_id: current_user.id)
  end
end
