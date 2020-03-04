defmodule ApiTrialWeb.Api.V1.Reaction do
  use Ecto.Schema
  import Ecto.Changeset

  # alias ApiTrialWeb.Api.V1.Reaction


  schema "reactions" do
    field :action, :string
    field :content_id, :string  # Ecto.UUID
    field :reaction_type, :string
    field :type, :string
    field :user_id, :string # Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [:type, :action, :content_id, :user_id, :reaction_type])
    |> validate_required([:type, :action, :content_id, :user_id, :reaction_type])
  end
end
