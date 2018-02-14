defmodule FryseDefaultTheme do
  @moduledoc false

  def author(%Fryse.Page{fryse: %Fryse{data: data}}, name) do
    case Map.get(data.authors, String.to_atom(name)) do
      nil -> raise "Cannot find author \"#{name}\""
      author -> author
    end
  end
end
