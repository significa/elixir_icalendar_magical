defmodule Magical.Serializer.DateSerializer do
  @moduledoc false

  def serialize(%Date{} = date) do
    {Calendar.strftime(date, "%Y%m%d"), %{value: "DATE"}}
  end

  def serialize(%DateTime{} = date_time) do
    case date_time.time_zone do
      tz when tz in ["Etc/UTC", "UTC"] ->
        {Calendar.strftime(date_time, "%Y%m%dT%H%M%SZ"), %{}}

      tzid ->
        {Calendar.strftime(date_time, "%Y%m%dT%H%M%S"), %{tzid: tzid}}
    end
  end

  def serialize(%NaiveDateTime{} = naive_date_time) do
    {Calendar.strftime(naive_date_time, "%Y%m%dT%H%M%S"), %{}}
  end
end
