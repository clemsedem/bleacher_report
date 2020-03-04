defmodule ApiTrialWeb.Api.V1.ReactionController do
  use ApiTrialWeb, :controller

  alias ApiTrialWeb.Api.V1.Reaction
  alias ApiTrialWeb.Api.V1.ReactionContext

  def reaction(conn, params) do
    # {:ok, body, _conn} = read_body(conn)
    IO.inspect params
    IO.puts "This is the type: "
    IO.puts params["type"]
    IO.puts "This is the content id: "
    IO.puts params["content_id"]

    action = params["action"]
    cond do
        action == "add" ->
          case ReactionContext.save_reaction(params) do
            {:ok, resp} ->
              {:ok, reactions} = Cachex.get(:my_cache, resp)
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(200, Poison.encode!(reactions))# render("reaction_create_success.json", reaction: react)
            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "reaction_create_failed.json", reaction: changeset)
          end
        action == "remove" ->
          case ReactionContext.save_reaction(params) do
            {:ok, resp} ->
              {:ok, reactions} = Cachex.get(:my_cache, resp)
              conn
              |> put_resp_content_type("application/json")
              |> send_resp(200, Poison.encode!(reactions))
            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "reaction_create_failed.json", reaction: changeset)
          end
        true ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Poison.encode!(%{"resp": "Invalid action"}))
    end
  end


  def reaction_count(conn, %{"content_id" => content_id}) do
      case ReactionContext.count_reactions(content_id) do
        {:ok, resp} ->
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(200, Poison.encode!(resp))
      end
  end


end
