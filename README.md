[![badge][apm]][package]
[![badge][chat]][#slack]

[Atom] Preview
==============
Preview your [_transpile_]d source code in [Atom].

Features live preview pane, error notifications, and [optional] scroll sync with the cursor.

![demo](demo.gif)

[Another] plugin for _[atom-transpile]_.

[Plugins][table]
----------------
_Preview_ relies on the same plugin system as the core _[atom-transpile]_ package (and is itself a plugin), so will work with [any others][another] you install.

See the [table] for a list of supported languages, or easily [create your own plugin][api] and add it to the list.

[API]
-----
Creating a plugin is as simple as possible. See -
the base example below, or the multiple existing packages for examples of how to implement your own.

Install
-------
`apm install transpile-preview` or search “preview” under Packages within Atom.

License
-------
[MIT] © [Daniel Bayley] et [al]

[MIT]:              LICENSE.md#the-mit-license-mit
[Daniel Bayley]:    https://github.com/danielbayley
[al]:               https://github.com/danielbayley/atom-transpile-preview/graphs/contributors

[atom]:             https://atom.io
[apm]:              https://img.shields.io/apm/v/transpile-preview.svg?style=flat-square
[package]:          https://atom.io/packages/transpile-preview
[chat]:             https://img.shields.io/badge/chat-atom.io%20slack-ff69b4.svg?style=flat-square
[#slack]:           https://atom-slack.herokuapp.com

[_transpile_]:      https://en.wikipedia.org/wiki/Source-to-source_compiler
[atom-transpile]:   https://atom.io/packages/transpile
[another]:          https://atom.io/packages/search?q=transpile-

[table]:            https://github.com/danielbayley/atom-transpile#plugins
[API]:              https://github.com/danielbayley/atom-transpile#api
