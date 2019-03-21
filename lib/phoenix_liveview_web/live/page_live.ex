defmodule PhoenixLiveviewWeb.PageLive do
  use Phoenix.LiveView

  alias PhoenixLiveview.Accounts
  alias PhoenixLiveview.Accounts.User

  def handle_event("validate", %{"user" => params}, socket) do
    changeset =
      %User{}
      |> User.changeset(params)

    case Ecto.Changeset.apply_action(changeset, :insert) do
      {:error, changeset_} ->
        {:noreply, assign(socket, changeset: changeset_)}

      {:ok, _data} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def mount(_session, socket) do
    changeset = Accounts.change_user(%User{})

    {:ok, assign(socket, changeset: changeset, action: "/")}
  end

  def render(assigns), do: PhoenixLiveviewWeb.PageView.render("index.html", assigns)
end
