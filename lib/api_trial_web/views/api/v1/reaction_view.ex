defmodule ApiTrialWeb.Api.V1.ReactionView do
  use ApiTrialWeb, :view
  alias ApiTrialWeb.Api.V1.ReactionView

  def render("reaction_create_success.json", %{reaction: reaction}) do
    "successful"

    # %{data: render_many(reaction, ReactionView, "reaction.json")}
  end

  def render("index.json", %{reactions: reactions}) do
    "successful"

    %{data: render_many(reactions, ReactionView, "reaction.json")}
  end

  def render("reaction_create_failed.json", %{reaction: reaction}) do
    "All fieds are requied"
    # %{data: render_many(reaction, ReactionView, "reaction.json")}
  end


  def render("reaction.json", %{reaction: reaction}) do
    %{type: reaction.type,
      action: reaction.action,
      content_id: reaction.content_id,
      user_id: reaction.user_id,
      reaction_type: reaction.reaction_type}
  end

end
