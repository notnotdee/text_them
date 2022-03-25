defmodule TextThem.Texts.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message_content, :string
    field :recipient, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:recipient, :message_content])
    |> validate_required([:recipient, :message_content])
  end
end
