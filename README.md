# Ranwords
Easily generate random words with their meaning and pronunciation.


## Get started

Add `ranwords` to your deps function in your `mix.exs`
```elixir
def deps do
  [
    {:ranwords, "~> 0.1.0"}
  ]
end
```
Run: `mix deps.get`


### Usage 
  
```elixir 
iex> Ranwords.randomWordALl

[
  %{
    "definition" => "Bent like a knee; jointed  ",
    "pronunciation" => "Jenikulate",
    "word" => "Geniculate"
  }
]

iex> Ranwords.randomWordMeaning
"Juncaceous | Of, like or pertaining to rushes"

iex> Ranwords.randomWordPronunciation
"Barbet | Barbet"
```

Not using Elixir? Check out the NPM library [https://www.npmjs.com/package/ranwords](https://www.npmjs.com/package/ranwords)

