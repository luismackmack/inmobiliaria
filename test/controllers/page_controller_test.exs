defmodule Inmobiliaria.PageControllerTest do
  use Inmobiliaria.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
