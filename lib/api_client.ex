defmodule WebserverAPI.Client do
  use GenServer

  @initial_state %{state: :ident, socket: nil}

  def start_link(socket, opts \\ []) do
    GenServer.start_link(__MODULE__, socket, opts)
  end

  def init(socket) do
    stuff = @initial_state
    stuff = %{stuff | socket: socket}

    {:ok, stuff}
  end

  def handle_info({:tcp, socket, data}, state) do
    serve(socket, data)
    :inet.setopts(socket, [active: :once])

    {:noreply, state}
  end

  def handle_info({:tcp_closed, _socket}, _state) do
    :logger.debug "TCP socket closed..."

    Process.exit(self(), :normal)
  end

  def handle_info({:tcp_error, _socket, reason}, _state) do
    :logger.debug "TCP socket encountered an error :: #{reason}. Closing..."

    Process.exit(self(), :normal)
  end

  defp serve(_socket, data) do
    :logger.debug "Got data :: #{data}"
  end
end
