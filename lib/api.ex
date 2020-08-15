defmodule WebserverAPI do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def start_link(_opt) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    :logger.debug "Started API server..."

    Process.send_after(self(), :work, 1)

    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    {:ok, listen_socket} = :gen_tcp.listen(62312, [:binary, active: :once, reuseaddr: true])

    loop(listen_socket)

    {:noreply, state}
  end

  defp loop(listen_socket) do
    {:ok, socket} = :gen_tcp.accept(listen_socket)

    :logger.debug "Accepted connection."

    {:ok, pid} = WebserverAPI.Client.start_link(%{socket: socket})
    :gen_tcp.controlling_process(socket, pid)

    :logger.debug "Looping through again."

    loop(listen_socket)
  end
end
