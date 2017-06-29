defmodule RsvpWeb.EventController do
  use RsvpWeb.Web, :controller

  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.get_by_id(id)

    render conn, "show.html", event: event
  end

  def index(conn, _params) do
    events = Rsvp.EventQueries.get_all

    render conn, "index.html", events: events
  end

  def new(conn, _params) do
    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, %{})

    render conn, "new.html", changeset: changeset
  end
  def new(conn, %{errors: errors}) do
    render conn, "new.html", changeset: errors
  end

  def create(conn, %{"events" => events}) do
    events = Map.update!(events, "date", fn d -> d <> ":00" end)

    changeset = Rsvp.Events.changeset(%Rsvp.Events{}, events)


    case Rsvp.EventQueries.create(changeset) do
      {:ok, %{id: id}} -> redirect(conn, to: event_path(conn, :show, id))
      {:error, reasons} -> new(conn, %{errors: reasons})
    end
  end

end
