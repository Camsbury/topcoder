defmodule CheckFunction do
  @moduledoc """
  Solves [Topcoder Check Function Problem](
  https://community.topcoder.com/stat?c=problem_statement&pm=4788)
  """
  
  @doc """
  Count the number of dashes in a number message
  """
  def new_function(message) do
    dash_count = {6, 2, 5, 5, 4, 5, 6, 3, 7, 6}
    count_dashes = &(elem(dash_count, &1) + &2)
    message |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(0, count_dashes)
  end
end

