defmodule Counter do
    use GenServer

    def start_link(state) do
        GenServer.start_link(__MODULE__, state)
    end 

    def init(state) do
        Process.register(self(), :counter)
        :erlang.send_after(1000, self(), :output)
        {:ok, state}
    end

    def handle_info(:add1, _state) do
        {:noreply, _state + 1}
    end

    def handle_info(:output, _state) do
        IO.puts "TPS: " <> Integer.to_string(_state)
        :erlang.send_after(1000, self(), :output)
        {:noreply, 0}
    end

end