defmodule RelativeHeights do
  @moduledoc """
  This module is designed to solve the [Topcoder Relative Heights Problem](
  https://community.topcoder.com/stat?c=problem_statement&pm=14644).
  """
 
  @doc """
  Count the number of building profiles can exist when one is removed.
  """
  def count_ways(tup) do
    elem(permute(tup), 0) |> Enum.reduce(MapSet.new, &insert_profile/2) |> MapSet.size
  end

  @doc """
  Insert a building profile into the set of all profiles
  """
  defp insert_profile(permutation, unique) do
    to_add = permutation |> profile
    unique |> MapSet.put(to_add)
  end
  
  @doc """
  Generate the given skyline's profile
  """
  defp profile(tup) do
    retrieve = &(tup |> elem(&1))
    looper = 0..(tuple_size(tup) - 1)
    profiler = looper |> Enum.sort_by(retrieve) |> List.to_tuple
    looper |> Enum.reduce({profiler, tup}, &profile/2)
  end

  @doc """
  Replace the building height with its relative rank
  """
  defp profile(height, {profiler, original}) do
    index = elem(profiler, height)
    original = original |> put_elem(index, height)
    {profiler, original}
  end

  @doc """
  Return all the permutations of a building being removed.
  """
  defp permute(tup) do
    0..(tuple_size(tup) - 1) |> Enum.reduce({[],tup}, &remove/2) 
  end
  
  @doc """
  Remove a building, and add it to the permutation list
  ""
  defp remove(index, {permutations, tup}) do
    permutations = [tup |> Tuple.delete_at(index)] ++ permutations
    {permutations, tup}
  end

end
