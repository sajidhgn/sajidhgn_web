defmodule SajidhgnWeb.Router do
  use SajidhgnWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SajidhgnWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", SajidhgnWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api", SajidhgnWeb do
    pipe_through :api

    resources "/services", ServiceController, except: [:new, :edit]
    resources "/introduction", IntroductionController, except: [:new, :edit]
    resources "/intro_services", Intro_ServiceController, except: [:new, :edit]
    resources "/skills_intro", Skill_IntroController, except: [:new, :edit]
    resources "/skills", SkillController, except: [:new, :edit]
    resources "/portfolios", PortfolioController, except: [:new, :edit]
    resources "/testimonials", TestimonialController, except: [:new, :edit]
    resources "/timelines", TimelineController, except: [:new, :edit]
    resources "/contacts", ContactController, except: [:new, :edit]


  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SajidhgnWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
