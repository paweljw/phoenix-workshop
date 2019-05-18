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

### Helpers

```elixir
HelloWeb.Router.Helpers.page_path(HelloWeb.Endpoint, :index)
```

```bash
$ mix phx.routes
```

---

# Repos

---

# Pytania?

https://paweljw.github.io/phoenix-workshop
https://github.com/paweljw/phoenix-workshop

---

# [APLAUZ]
