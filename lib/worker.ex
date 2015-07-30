defmodule Worker do
    use GenServer

    def start_link(state) do
        GenServer.start_link(__MODULE__, state)
    end 

    def init(id) do
        Process.register(self(), id)
        generate_msg()
        {:ok, []}
    end

    def handle_info({:data, data}, _state) do
        #{:ok, data} = JSON.decode(data)
        data = :jiffy.decode(data) 
        |> elem(0)
        |> Enum.into(%{})

        #url = data["url"]
        #IO.puts url

        send :counter, :add1
        
        generate_msg()
        
        {:noreply, []}
    end

    def generate_msg() do

        data = "{\"url\": \"/elixir\", \"domain\": \"blog.eood.cn\", \"ip1:\": \"193.27.333.111\", \"ip2\": \"54.148.132.221\", \"status\": 200, \"time\": 0.024, \"size1\": 590, \"size2\": 1854, \"ua\": \"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html\"}"      
        :erlang.send_after(1, self(),
                       {:data, data})
  end
end