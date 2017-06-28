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
end
