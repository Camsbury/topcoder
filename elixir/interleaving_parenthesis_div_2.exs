defmodule InterleavingParenthesisDiv2 do
  @moduledoc """
  Solve [TopCoder Interleaving Parenthesis Div2](
  https://community.topcoder.com/stat?c=problem_statement&pm=14642)
  """


  @doc """
  Count ways two parenthesis strings can be interleaved properly
  """
  def count_ways(string1, string2)
  when is_binary(string1) and is_binary(string2) do
    count_ways(String.to_charlist(string1),
               String.to_charlist(string2))
  end

  def count_ways(list1, list2)
  when is_list(list1) and is_list(list2) do
    find_ways(list1, list2, 0, []) |> length()
  end


  defp find_ways([], [], open, acc)
  when is_integer(open) and is_list(acc) do
    case open do
      0 ->
        [acc]
      _ ->
        []
    end
  end

  defp find_ways([], list, open, acc)
  when is_integer(open) and is_list(acc) and
  is_list(list) do
    process_head(list, [], open, acc)
  end

  defp find_ways(list, [], open, acc)
  when is_integer(open) and is_list(acc) and
  is_list(list) do
    process_head(list, [], open, acc)
  end

  defp find_ways(list1, list2, open, acc)
  when is_integer(open) and is_list(acc) and
  is_list(list1) and is_list(list2) do
    process_head(list1, list2, open, acc) ++
      process_head(list2, list1, open, acc)
  end

  defp process_head([head | tail], list2, open, acc)
  when is_integer(open) and is_list(acc) and
  is_list(list2) do
    cond do
      head == 40 ->
        find_ways(tail, list2, open + 1, acc ++ [head])
      head == 41 ->
        cond do
          open > 0 ->
            find_ways(tail, list2, open - 1, acc ++ [head])
          true ->
            []
        end
      true ->
        find_ways(tail, list2, open, acc ++ [head])
    end
  end
end
