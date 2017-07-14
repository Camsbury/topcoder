defmodule DiagonalDisproportion do
  @moduledoc """
  Solve [TopCoder Diagonal Disproportion Problem](
  https://community.topcoder.com/stat?c=problem_statement&pm=6003)
  """
  
  @doc """
  Calculate the diagonal disproportion of a matrix
  """
  def get_disproportion(matrix) do
    looper = 0..(tuple_size(matrix) - 1)
    elem(Enum.reduce(looper, {0, matrix}, &aggregate/2), 0)
  end

  defp aggregate(index, {current, mat}) do
    row = elem(mat, index)
    size = tuple_size(mat)
    to_add = String.at(row, index) |> String.to_integer()
    to_sub = String.at(row, size - index - 1) |> String.to_integer()
    {current + to_add - to_sub, mat}
  end
end

