defmodule RelativeHeights do
 
  def count_ways(tup) do
    elem(permute(tup), 0) |> Enum.reduce(MapSet.new, &insert_profile/2) |> MapSet.size
  end

  defp insert_profile(permutation, unique) do
    to_add = permutation |> profile
    unique |> MapSet.put(to_add)
  end
  
  defp profile(tup) do
    retrieve = &(tup |> elem(&1))
    looper = 0..(tuple_size(tup) - 1)
    profiler = looper |> Enum.sort_by(retrieve) |> List.to_tuple
    looper |> Enum.reduce({profiler, tup}, &profile/2)
  end

  defp profile(height, {profiler, original}) do
    index = elem(profiler, height)
    original = original |> put_elem(index, height)
    {profiler, original}
  end

  defp permute(tup) do
    0..(tuple_size(tup) - 1) |> Enum.reduce({[],tup}, &remove/2) 
  end
  
  defp remove(index, {permutations, tup}) do
    permutations = [tup |> Tuple.delete_at(index)] ++ permutations
    {permutations, tup}
  end

end
