defmodule TextThem.TextsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TextThem.Texts` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        message_content: "some message_content",
        recipient: "some recipient"
      })
      |> TextThem.Texts.create_message()

    message
  end
end
