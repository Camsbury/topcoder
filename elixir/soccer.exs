defmodule Soccer do
  @moduledoc """
  Solve [TopCoder Soccer Problem](
  https://community.topcoder.com/stat?c=problem_statement&pm=1650)
  """

  @doc """
  Return max points won by a team
  """
  def max_points(wins, ties) do
    do_max_points(wins, ties, 0)
  end

  defp do_max_points([],
                     [],
                     current) do
    current
  end

  defp do_max_points([w_head | w_tail],
                 [t_head | t_tail],
                 current) do
    current = max(current, w_head*3 + t_head)
    do_max_points(w_tail, t_tail, current)
  end
end
