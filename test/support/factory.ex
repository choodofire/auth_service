defmodule AuthService.Support.Factory do
  use ExMachina.Ecto, repo: AuthService.Repo
  alias AuthService.Accounts.Account

  def account_factory do
    %Account{
      email: Faker.Internet.email(),
      hash_password: Faker.Internet.slug()
    }
  end

end
