defmodule Ranwords do
  @moduledoc """
  Generates random words with their meaning and pronunciation.
  """

  @doc """
  Easily generate random words.


  ## Examples

      iex> Randwords.generate
      
      [
        %{
          "definition" => "Bent like a knee; jointed  ",
          "pronunciation" => "Jenikulate",
          "word" => "Geniculate"
        }
      ]

  """
  @base_url "https://random-words-api.vercel.app/word"

  @doc """
  Fetching the API and return the body with cases

  Once we run into an error, we return it from the Error module
  """
  def fetchData do
    case Ranwords.Base.get!("#{@base_url}") do
      %HTTPoison.Response{body: body, status_code: 200} ->
      Poison.decode!(body)

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _ ->
        raise Ranwords.Error
    end
  end

  @doc """
  Format down the data to be more readable
  """
  def map_from_list(list) do 
    list 
      |> List.first()
  end

  @doc """
  Helper functions so output is formatted well
  """
  def get_meaning_format() do 
    list = Ranwords.fetchData()
    map = map_from_list(list)

    map["word"] <> " | " <> map["definition"]
  end

  def get_pronunciation_format() do 
    list = Ranwords.fetchData()
    map = map_from_list(list)

    map["word"] <> " | " <> map["pronunciation"]
  end

  @doc """
  Returns the whole data (word, meaning, pronunciation)
  """
  def randomWordAll do 
    Ranwords.fetchData
  end

  @doc """
  Returns the meaning of the word
  """
  def randomWordMeaning do 
    get_meaning_format() 
  end

  @doc """
  Returns the pronunciation
  """
  def randomWordPronunciation do 
    get_pronunciation_format() 
  end
end
