defmodule HuemulixirWeb.Huemul do
  use Surface.LiveComponent

  alias HuemulixirWeb.Router.Helpers, as: Routes

  # MARK: - Module Attributes
  @ok_moods [
    "huemul-glow.gif",
    "huemul-patitas.gif",
    "huemul-heart.png"
  ]

  @no_moods [
    "huemul-lazer.gif",
    "huemul-head.gif"
  ]

  @neutral_moods [
    "huemul.png"
  ]

  # MARK: - Component Attributes
  prop(advice, :struct, required: true)

  # MARK: - Helpers
  def image_for_mood(socket, mood) do
    Routes.static_path(
      socket,
      "/images/" <>
        List.first(
          Enum.take_random(
            case mood do
              :ok -> @ok_moods
              :no -> @no_moods
              _ -> @neutral_moods
            end,
            1
          )
        )
    )
  end

  def color_for_mood(mood) do
    case mood do
      :ok -> "is-success"
      :no -> "is-error"
      _ -> "is-warning"
    end
  end

  # MARK: - Render
  def render(assigns) do
    ~F"""
        <div :hook="Huemul">
            <p class={
                      color_for_mood(@advice.mood),
                      "animate__animated",
                      "animate__backInDown"
            }>
              {@advice.text}
            </p>
            <img
                class="animate__animated animate__zoomIn"
                src={image_for_mood(@socket, @advice.mood)}
                title={@advice.mood}
            >
        </div>
    """
  end
end
