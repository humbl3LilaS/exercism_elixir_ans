defmodule Newsletter do
  def read_emails(path) do
    path |> File.stream!() |> Stream.map(&String.trim_trailing/1) |> Enum.to_list()
  end

  def open_log(path) do
    path |> File.open!([:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    pid = open_log(log_path)

    read_emails(emails_path)
    |> Enum.each(fn mail ->
      if send_fun.(mail) == :ok do
        IO.puts(pid, mail)
      end
    end)

    close_log(pid)
    :ok
  end
end
