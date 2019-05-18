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
* build Posts with `mix phx.gen.html Posting Post posts author_id:references:users body:text`
* remember to change `example/lib/beeper/posting/post.ex` so it has a `belongs_to` on :author, it's not User but Beeper.Coherence.User!
* remember to change the Posting repo to preload :author and add an order clause
* remember to drop extraneous roots
* remember to Map.merge author_id in PostController and add a redirect to /
* update routes to have Posts :index at /
* snazzy up the post display with CSS and html trickery, show off view
* build a channel
* socket needs Phoenix.Token instead of Coherence jazz
* add a PostChannel with just join
* add a broadcast to PostController
* add appropriate JS and a CSS highlight
* add token and user ID to meta
* update Form and post index for more Beepery feel
