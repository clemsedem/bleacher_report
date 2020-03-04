defmodule ApiTrialWeb.Api.V1.ReactionContext do
  alias ApiTrialWeb.Api.V1.Reaction

  def save_reaction(attrs \\ %{}) do
    # %Reaction{}
    reaction = Reaction.changeset(%Reaction{}, attrs)
    key = UUID.uuid4()
    if reaction.valid? do
      Cachex.put(:my_cache, key, reaction.changes)
      {:ok, key}
    end
  end

  def count_reactions(content_id) do
    {:ok, keys} = Cachex.keys(:my_cache)
  
    Enum.each keys, fn key ->
    {:ok, reg} = Cachex.get(:my_cache, key)
    end
    {:ok, reg}
  end

end
