defmodule CostOfDancing do
  @moduledoc """
  Solve [TopCoder Cost of Dancing Problem](
  https://community.topcoder.com/stat?c=problem_statement&pm=13195)
  """

  @doc """
  Find the minimum cost of count courses
  """
  def minimum(count, costs) do
    costs |> Tuple.to_list() |> Enum.sort()
    |> Enum.take(count) |> Enum.reduce(&(&1 + &2))
  end
end

