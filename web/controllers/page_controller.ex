defmodule MyTurn.PageController do
  use MyTurn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
