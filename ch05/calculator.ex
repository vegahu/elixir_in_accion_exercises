defmodule Calculator do

  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(value) do
    new_value = receive do
      message -> process_message(value, message)
    end
    loop(new_value)
  end

  defp process_message(value, {:value, pid}) do
    send(pid, {:response, value})
    value
  end

  defp process_message(value, {:add, data}), do: value + data
  defp process_message(value, {:sub, data}), do: value - data
  defp process_message(value, {:mul, data}), do: value * data
  defp process_message(value, {:div, data}), do: value / data

  def value(pid) do
    send(pid, {:value, self})
    receive do
      {:response, value} -> value
    end
  end

  def add(pid, value), do: send(pid, {:add, value})
  def sub(pid, value), do: send(pid, {:sub, value})
  def mul(pid, value), do: send(pid, {:mul, value})
  def div(pid, value), do: send(pid, {:div, value})

end
