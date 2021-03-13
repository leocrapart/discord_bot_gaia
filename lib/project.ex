defmodule Project do
  @moduledoc """
  Documentation for `Project`.
  """

  @doc """
  Hello world.
  """
  def run do
    CommandExtractor.extract_command("*hello")
  end
end


