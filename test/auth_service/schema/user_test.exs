defmodule AuthService.Schema.UserTest do
  use ExUnit.Case
  alias AuthService.Users.User

  @expected_fields_with_types [
    {:id, :binary_id},
    {:full_name, :string},
    {:gender, :string},
    {:biography, :string},
    {:inserted_at, :naive_datetime},
    {:updated_at, :naive_datetime},
    {:account_id, :binary_id}
  ]

  describe "fields and types" do
    test "it has correct fields and types" do
      actual_fields_with_types =
        for field <- User.__schema__(:fields) do
          type = User.__schema__(:type, field)
          {field, type}
        end

        assert MapSet.new(actual_fields_with_types) == MapSet.new(@expected_fields_with_types)
    end
  end
end
