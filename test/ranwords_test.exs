defmodule RanwordsTest do
  use ExUnit.Case
  doctest Ranwords

  test "greets the world" do
    assert Ranwords.hello() == :world
  end
end
