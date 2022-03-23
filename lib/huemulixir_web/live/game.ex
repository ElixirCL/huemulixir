defmodule HuemulixirWeb.Game do
  use Surface.LiveView

  alias Huemulixir.Advices
  alias HuemulixirWeb.Huemul

  data(show_huemul?, :boolean, default: false)
  data(advice, :boolean)

  def handle_event("show", _, socket) do
    {:noreply,
     socket
     |> assign(:show_huemul?, true)
     |> assign(:advice, Advices.one())}
  end

  def handle_event("reset", _, socket) do
    {:noreply, assign(socket, :show_huemul?, false)}
  end

  # MARK: - Render
  def render(assigns) do
    ~F"""
        <div class="nes-container with-title is-centered" style={"margin-top": "10%", "background-color": "white"}>

            {#if @show_huemul? }
                <div>
                    <Huemul id="huemul" advice={@advice}/>
                </div>

                <div class="animate__animated animate__fadeInUpBig">
                    <button :on-click="reset" class="nes-btn is-success">Deseo más de su sabiduría</button>
                </div>

            {#else}

                <div class="animate__animated animate__lightSpeedInLeft">
                    <p class="title" style={"margin-top": "10%"}>
                        Piensa tu pregunta. El gran <span class="text-blue-200">Huemul</span> te dará su respuesta.
                    </p>
                </div>

                <div class="animate__animated animate__fadeInUpBig">
                    <button :on-click="show" type="button" class="nes-btn is-primary">¿Qué opina el gran Huemul?</button>
                </div>
            {/if}
        </div>
    """
  end
end
