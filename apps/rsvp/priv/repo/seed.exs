unless Rsvp.EventQueries.any do
  Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2017-06-30 09:00:00", title: "Summer codefest", location: "Omaha, NE"})
  |> Rsvp.EventQueries.create
  Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2017-06-30 09:00:00", title: "winter coderest", location: "London, UK"})
  |> Rsvp.EventQueries.create
end
