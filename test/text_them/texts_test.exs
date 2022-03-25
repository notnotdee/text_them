defmodule TextThem.TextsTest do
  use TextThem.DataCase

  alias TextThem.Texts

  describe "messages" do
    alias TextThem.Texts.Message

    import TextThem.TextsFixtures

    @invalid_attrs %{message_content: nil, recipient: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Texts.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Texts.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{
        message_content: "some message_content",
        recipient: "some recipient"
      }

      assert {:ok, %Message{} = message} = Texts.create_message(valid_attrs)
      assert message.message_content == "some message_content"
      assert message.recipient == "some recipient"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Texts.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()

      update_attrs = %{
        message_content: "some updated message_content",
        recipient: "some updated recipient"
      }

      assert {:ok, %Message{} = message} = Texts.update_message(message, update_attrs)
      assert message.message_content == "some updated message_content"
      assert message.recipient == "some updated recipient"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Texts.update_message(message, @invalid_attrs)
      assert message == Texts.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Texts.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Texts.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Texts.change_message(message)
    end
  end
end
