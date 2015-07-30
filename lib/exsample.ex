defmodule ExSample do
    use Application

    def start(_type, _args) do

        import Supervisor.Spec

        counters = [worker(Counter, [0], id: "counter")]

        workers = Enum.map 1..500, fn(x) -> 
            id = "worker_" <> Integer.to_string(x); worker(Worker, [String.to_atom(id)], id: id) 
        end
        
        opts = [strategy: :one_for_one, name: ExSample.Supervisor]

        Supervisor.start_link(counters ++ workers, opts)
        
    end

end
