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
        <div class="flex flex-col items-center justify-center h-screen bg-black">

            {#if @show_huemul? }
                <div class="pb-8">
                    <Huemul id="huemul" advice={@advice}/>
                </div>
            
                <div class="animate__animated animate__fadeInUpBig">
                    <button :on-click="reset" class="bg-white p-4 font-medium text-3xl">Deseo más de su sabiduría</button>
                </div>

            {#else}
                <div class="animate__animated animate__lightSpeedInLeft text-white pb-8">
                    <p class="p-4 font-medium leading-tight text-4xl">
                        Piensa tu pregunta. El gran <span class="text-blue-200">Huemul</span> te dará su respuesta.
                    </p>
                </div>

                <div class="animate__animated animate__fadeInUpBig">
                    <button :on-click="show" class="bg-white p-4 font-medium text-3xl">¿Qué opina el gran Huemul?</button>
                </div>
            {/if}
        </div>
    """
  end
end
