defmodule Wabanex.Users.Get do
  import Ecto.Query

  alias Ecto.UUID
  alias Wabanex.{Repo, Training, User}

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid UUID"}

      {:ok, uuid} ->
        handle_get_user(uuid)
    end
  end

  def handle_get_user(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User was not found"}
      user -> {:ok, load_training(user)}
    end
  end

  defp load_training(user) do
    today = Date.utc_today()

    query =
      from training in Training,
        where: ^today >= training.start_date and ^today <= training.end_date

    Repo.preload(user, trainings: {first(query, :inserted_at), :exercises})
  end
end
