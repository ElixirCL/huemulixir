defmodule Huemulixir.Advice do
  defstruct [:mood, :text]
end

defmodule Huemulixir.Advices do
  alias Huemulixir.Advice

  # from: https://github.com/devschile/huemul/blob/master/scripts/bola8.js
  @advises [
    %Advice{mood: :ok, text: "En mi opinión, sí"},
    %Advice{mood: :ok, text: "Es cierto"},
    %Advice{mood: :ok, text: "Es decididamente así"},
    %Advice{mood: :ok, text: "Probablemente"},
    %Advice{mood: :ok, text: "Buen pronóstico"},
    %Advice{mood: :ok, text: "Todo apunta a que sí"},
    %Advice{mood: :ok, text: "Sin duda"},
    %Advice{mood: :ok, text: "Sí"},
    %Advice{mood: :ok, text: "Sí - definitivamente"},
    %Advice{mood: :ok, text: "Debes confiar en ello"},
    %Advice{mood: :neutral, text: "Déja pensarlo un poco mejor, vuelve a intentarlo"},
    %Advice{mood: :neutral, text: "Pregunta en otro momento"},
    %Advice{mood: :neutral, text: "Será mejor que no te lo diga ahora"},
    %Advice{mood: :neutral, text: "No puedo predecirlo ahora"},
    %Advice{mood: :neutral, text: "Concéntrate y vuelve a preguntar"},
    %Advice{mood: :no, text: "No cuentes con ello"},
    %Advice{mood: :no, text: "Mi respuesta es no"},
    %Advice{mood: :no, text: "Mis fuentes me dicen que no"},
    %Advice{mood: :no, text: "Las perspectivas no son buenas"},
    %Advice{mood: :no, text: "Muy dudoso"}
  ]

  def one do
    List.first(Enum.take_random(@advises, 1))
  end
end
