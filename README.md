birthday-corkboard
==================

A simple birthday corkboard that shows birthdays as sticky notes. Uses MongoDB, Node.js and Angular.js.

Notes
-----

Every note is a custom element I made while learning Polymer, ie:

```html
<birthday-pinned-note
  birthday="26" 
  name="Eduardo" 
  noteStyle="{"color": "red", "onEnter": "drop-tilted-left"}">
</birthday-pinned-note>
```

* **birthday**: the birthday's day of the month.
* **name**: name of the birthday guy/gal.
* **noteStyle**: style for the note:
  + **color**: the note's color: red, blue, green, yellow, pink, brown, black.
  + **pattern**: the note's pattern, right now there's only a little crown pattern: crown.
  + **onEnter**: the note's entrance behavior (it can also alter the note's tilting): drop, drop-glow, drop-tilted-right, drop-tilted-right-glow, drop-tilted-left, drop-tilted-left-glow.