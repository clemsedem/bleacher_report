defmodule ApiTrialWeb.Router do
  use ApiTrialWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiTrialWeb, as: :api do
    pipe_through :api

    scope "/vi", Api.V1, as: :v1 do
      post "/reaction", ReactionController, :reaction
      get "/reaction_counts/:content_id", ReactionController, :reaction_count
    end

  end
end
