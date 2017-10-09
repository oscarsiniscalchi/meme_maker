# MemeMaker

A simple ruby class that uses [MiniMagic](https://github.com/minimagick/minimagick) to create memes.

# USAGE

Require the file and use it like This

`MemeMaker.generate('http://lorempixel.com/800/600', 'This is the header', 'This is the subheader')`

# TODO:

- Handle multiline headers and sub headers (Adapt font size).
- Check timeout issue with big images.
- Enable use of a symbol parameter to create common used memes IE: `MemeMaker.generate(:anti_joke_chiken, 'How do you make a plumber cry?', 'you kill his family')`
- Investigate why the stroke parameter is not working (currently worked around with 2 shadows)
