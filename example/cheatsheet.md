# Setup

* mix phx.new --binary-id --verbose --app beeper example
* cd example
* set up dev DB - watch the port!
* mix ecto.create
* mix phx.server
* customize the app to say "Beeper" in main template, show off live reload
* install coherence - from git! `{:coherence, git: "https://github.com/appprova/coherence.git", branch: "upgrade-to-phoenix-1.4"}` - https://github.com/smpallen99/coherence/issues/410
* `mix deps.get`
* `mix coh.install --full --no-recoverable --no-lockable --no-unlockable-with-token`
* add what it suggests to router.ex, CAREFUL to pipe main scope through :protected; show off routes
* go back to presentation and talk about routes
* add what it suggests to seeds
* go back to presentation and talk about repos
* show off migration
* `mix ecto.setup`
* show off login process
* add coherence to channels https://hexdocs.pm/coherence/readme.html#phoenix-channel-authentication - surprise tool for later
* remember difference between Beeper and BeeperWeb when customizing layouts `<%= BeeperWeb.Coherence.ViewHelpers.coherence_links(@conn, :layout) %>`
* build Posts with `mix phx.gen.schema Post posts body:text author:references:users`
