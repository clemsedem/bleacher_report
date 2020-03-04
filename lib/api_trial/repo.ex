defmodule ApiTrial.Repo do
  use Ecto.Repo,
    otp_app: :api_trial,
    adapter: Ecto.Adapters.Postgres
end
