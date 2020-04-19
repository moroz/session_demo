defmodule SessionDemo.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_hash, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> maybe_hash_password()
  end

  defp maybe_hash_password(%{valid?: true} = changeset) do
    case get_field(changeset, :password) do
      password when is_binary(password) ->
        change(changeset, Argon2.add_hash(password))

      _ ->
        changeset
    end
  end
end
