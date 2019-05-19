---
title: Warsztaty - Phoenix
theme: ./slides/assets/style.css
revealOptions:
    transition: 'fade'
highlightTheme: 'monokai'
---

<!-- .slide: data-background="./assets/codest-opener.svg" id="opener" -->

# Phoenix w praktyce

<br/>
<br/>
<br/>
<br/>

## Pawel J. Wal @ Codest 2019

---

## Zasady

* MINASWAN!
* Pytaj, przerywaj, poprawiaj
* "Nie wiem" jest OK
* Bez telefonów proszę

---

# Phoenix

Note: Phoenix. Co to w ogóle jest?

----

> Phoenix brings back the simplicity and joy in writing modern web applications (...)

> Create rich, interactive experiences (...) with our real-time streaming technology called Channels.

&mdash; https://phoenixframework.org/

Note: Elixir swietnie radzi sobie z architekturami klient-serwer - realtime; Phoenix mocno na tym bazuje z Channels (troche jak ActionCable, tylko mniej bez sensu)

----

### Ruby + Rails
### ~
### Elixir + Phoenix

Note: oba frameworki maja podobny cel, choc nie identyczna konstrukcje.
Ale Rubyiscie nie bedzie sie trudno odnalezc w Phoenixie.

---

## Beeper

<img src="./assets/beeper.png" style="height: 400px; border: 0px none">

----

## Beeper - klon Twittera

* użytkownicy
* "beepy"
* insta-streamująca strona główna

Note: kojarzycie jak Twitter wymaga kliknięcia jak są nowe tweety? Lame. Nasze będzie streamować cały czas.

---

## Narzędzia

* Phoenix - https://hexdocs.pm/phoenix/installation.html
* Coherence - https://github.com/smpallen99/coherence
* Channels (wbudowane w Phoenixa)

----

## Coherence

* Coherence ~ Devise
* Dzięki niemu mamy użytkowników z głowy ;)

----

### Co jeszcze jest w pudełku?

* Ecto ~ ActiveRecord
* Postgrex ~ pg
* Webpack, jak to Webpack

---

### Czas na praktykę!

<img src="./assets/thankyou2.gif">

---

# Routes

Note: Jak zorganizowane są routes w Phoenixie?

----

### Pipeline(s)

```elixir
pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
end
```

> Plug is a specification for constructing composable modules to build web applications.

Note:

w Phoenixie mamy pipelines złozone z jednego lub więcej plugów. Plugi to moduly o znanym specu ktore mozna komponowac i przez ktore request przelatuje w znanej kolejnosci.

Troche jak Rackowe stackowanie warstw.

----

### Resources

```elixir
get "/", PageController, :index

resources "/users", UserController

resources "/posts", PostController, only: [:index, :show]
```

Note:

Bardzo podobnie jak w Railsach. Mamy helpery get post put patch delete itd, i mamy helper "resources" analogicznie.

----

### Helpers

```elixir
HelloWeb.Router.Helpers.page_path(HelloWeb.Endpoint, :index)
```

```bash
$ mix phx.routes
```

Note:

router zapewnia nam tez, jak w Railsach, pewne path helpery. Warto jednak zwrocic uwage ze nie ma magii jak w Railsach - gdzie helpery
mamy od razu wstrzykniete w scope. Tu trzeba sie odwolac do modulu. Trzeba tez zauwazyc he HelloWeb to przyklad i tam bedzie nazwa naszego modulu.
Czyli inaczej niz w railsach bezmyslna copypasta z netu nie dziala :)

---

# Repos

Note: ActiveRecord przyzwyczaja do operowania na obiektach, ale Elixir nie ma obiektow. Wiec jak to rozwiazujemy? Przez Repo.

----

### Repo

* odpowiada za dostęp do bazy danych
* operujemy na nim za pomocą Ecto.Query

https://hexdocs.pm/ecto/Ecto.Repo.html

----

### Repos!

* jedno repo per aplikacja byłoby niewygodne
* organizujemy je w konteksty
* odwrotnie niż w Railsach wszystko możemy zmodyfikować

Note:

na przyklad Takie Posts.all zawsze dziala tak samo. W Phoenixie moemy tworzyć dowolne funkcje i modyfikować ich zachowanie

----

### Schema

* Schema mapuje structy Elixira do zewnętrznych struktur danych
* Schemy też możemy dowolnie modyfikować
* Definiujemy w nich klucze, relacje, mapowania, walidacje, ...

https://hexdocs.pm/ecto/Ecto.Schema.html

----

### Query

* Ecto dostarcza moduł pozwalający na budowanie zapytań
* ActiveRecord ogranicza, Ecto daje nam dość sznurka żeby się zastrzelić

https://hexdocs.pm/ecto/Ecto.Query.html

----

### Query

```elixir
# Create query
query = from u in "users",
          where: u.age > 18,
          select: u.name

# Send the query to the repository
Repo.all(query)
```

Note: w ten sposób mozna budowac query - ze wszystkim co chcesz, joinami, having, order, distinct, groupby, ...

----

### Query

```elixir
def with_minimum(age, height_ft) do
  from u in "users",
    where: u.age > ^age and u.height > ^(height_ft * 3.28),
    select: u.name
end

with_minimum(18, 5.0)

# where: u.age > type(^age, :integer),
```

Note: mozemy bindować tez zewnętrzne wartości do wnętrza query oraz wprowadzac explicit casty.

---

# Views

Note: podobnie jak helpery w Railsach, ale znacznie mocniej scoped.

----

### Views

* PostController => PostView
* View jest _wymagany_
* Wszelka logika prezentacyjna idzie do konkretnego View
* Globalne helpery trzymamy gdzie indziej (np. w dedykowanym module)

https://hexdocs.pm/phoenix/Phoenix.View.html

----

### Views

* Wszystkie widoki są prekompilowane (compile-time)
* View nie generuje disk-loadów po kompilacji (!!!)

Note: i między innymi dlatego Phoenix moze byc DZIKO szybki.

---

# Channels

----

### Channels

* jak ActionCable...
* ...na WROTKACH Z DOPALACZEM
* napędzane GenServerami

https://hexdocs.pm/phoenix/Phoenix.Channel.html#content

Note: channele pozwalaja nam na komunikacje push z serwerem (websockets, long polling)

----

### Channels

* Kanał ma pokoje
* Pokój ma subskrybentów
* PubSub - klient (lub serwer) broadcastuje, klienci odbierają i reagują

----

### Channels

* Można czytać i pisać po nich z:
  * Elixira
  * JavaScriptu
  * ??? (cokolwiek da radę podpiąć się pod websocket)

----

### Channels

* Zabezpieczamy tokenami które generujemy na backendzie i przekazujemy do JSa
* Pomaga w tym Phoenix.Token

https://hexdocs.pm/phoenix/Phoenix.Token.html#content

---

# Pytania?

https://paweljw.github.io/phoenix-workshop
https://github.com/paweljw/phoenix-workshop

@paweljwal

---

# [APLAUZ]
