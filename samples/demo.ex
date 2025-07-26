# Simple Elixir theme state
defmodule Theme do
  use Agent

  def start_link(variant \\ :veil) do
    Agent.start_link(fn -> variant end, name: __MODULE__)
  end

  def get do
    Agent.get(__MODULE__, & &1)
  end

  def set(variant) when variant in [:veil, :obsidian, :radiance] do
    Agent.update(__MODULE__, fn _ -> variant end)
  end

  def colors do
    case get() do
      :veil -> %{bg: "#1E1E2E", fg: "#D9E0EE"}
      :obsidian -> %{bg: "#000A0F", fg: "#C0C0CE"}
      :radiance -> %{bg: "#F7F7FF", fg: "#1E1E2E"}
    end
  end
end

# Usage:
# Theme.start_link()
# Theme.set(:obsidian)
# Theme.colors()