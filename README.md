# vim-slideshow

This plugin limits your ability. For 2 reasons:

* it's alpha, so it may very well (read: will) break.
* you navigate a file as a set of slides, not as a whole.

## What does it do?

This plugin has the following features:
* it "cuts" a document in slides which size is the number of lines available on screen
* it allows motions only in the current slide
* you can jump from slide to slide
* => Each slide is statically displayed on screen. You can not go off-track
* The command line always shows the name of your presentation

## What is it good for?

* showing slides with code
* showing slides in raw Markdown (or whatever you see fit)
* show off your vim skills

## Installation

I'll use [Plug](https://github.com/junegunn/vim-plug) in this example.
Adapt accordingly with yout plugin manager.
If you don't use a plugin manager, start now.

```vim
Plug 'xcambar/vim-slideshow'
```

## Usage

The following command is available after installing the plugin:

`:Slideshow <title>`

This will remove anything unnecessary onscreen.

Navigate through slides with the following mappings:

* `J` to go down one slide
* `K` to go up one slide

Running `:Slideshow` again will somewhat restore the previous state, but not completely yet.
You're advised to quit/restart vim if you want to go back.
That is in the incoming feature list.

## License

MIT
