defmodule SessionDemo.Users.Passwords do
  def hash_password(password) do
    Argon2.hash_pwd_salt(password)
  end

  def check_password(hashed, input) do
    Argon2.verify_pass(input, hashed)
  end
end
