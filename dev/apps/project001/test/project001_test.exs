defmodule Project001Test do
  use ExUnit.Case
  doctest Project001

  test "greets the world" do
    assert Project001.hello() == :world
  end
end
