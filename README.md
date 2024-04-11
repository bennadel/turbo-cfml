# Turbo CFML

This is a fork of the [Hotwire Turbo][hotwire-turbo] project. My only goal here is to make Turbo a bit more CFML compatible by including `cfc`, `cfm`, and `cfml` in the list of file extensions that Turbo considers to be likely to serve HTML content.

For reasons that I don't understand, the Turbo maintainers seem extremely hesitant about putting this type of configuration into the hands of the developers (despite many people submitting PRs to this effect). As such, forking this project seemed like the path of least resistance.

I have left most of the original files here in tact; and, changed only what I needed to in order to add CFML support and to allow me to build and install this repository as a `package.json` dependency.

[hotwire-turbo]: https://github.com/hotwired/turbo

----

## Turbo (Original Readme)

Turbo uses complementary techniques to dramatically reduce the amount of custom JavaScript that most web applications will need to write:

* Turbo Drive accelerates links and form submissions by negating the need for full page reloads.
* Turbo Frames decompose pages into independent contexts, which scope navigation and can be lazily loaded.
* Turbo Streams deliver page changes over WebSocket or in response to form submissions using just HTML and a set of CRUD-like actions.
* Turbo Native lets your majestic monolith form the center of your native iOS and Android apps, with seamless transitions between web and native sections.

It's all done by sending HTML over the wire. And for those instances when that's not enough, you can reach for the other side of Hotwire, and finish the job with [Stimulus](https://github.com/hotwired/stimulus).

Read more on [turbo.hotwired.dev](https://turbo.hotwired.dev).

## Contributing

Please read [CONTRIBUTING.md](./CONTRIBUTING.md).

© 2024 37signals LLC.
