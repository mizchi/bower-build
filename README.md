# bower-build

Concat all `main` files of bower dependents by extension.

Inspired by [Brunch](http://brunch.io/ "Brunch | ultra-fast HTML5 build tool") and [ck86/main-bower-files](https://github.com/ck86/main-bower-files "ck86/main-bower-files")

```
npm install -g bower-build
```

## Example

For example, codemirror's `bower.json`'s `main` is `["lib/codemirror.js", "lib/codemirror.css"]`.

```
$ bower install --save jquery codemirror
$ bower-build -o public -p vendor --debug
write: /Users/mizchi/proj/bower-build/public/vendor.js # include codemirror.js and jquery.js
write: /Users/mizchi/proj/bower-build/public/vendor.css # include codemirror.css
```

Write your bower's overrides option by your case. See [Overrides · Issue #585 · bower/bower](https://github.com/bower/bower/issues/585 "Overrides · Issue #585 · bower/bower")

## OPTIONS

- `-d`, `--dev`: (booelan) set target to `devDependencies` (default `dependencies`)
- `-o`, `--out`: set output dir (default `.`)
- `-p`, `--prefix`: set output filename prefix (default `vendor`)
- `--debug`: (boolean) dump internal

## Use in node

```javascript
var bowerBuild = require('bower-build');
bowerBuild({dev: true, out: "dist", prefix:"all", debug: true}); //sync
```

## TODO

- Sort by its dependent
- Sourcemap(https://github.com/lydell/source-map-concat)
- Concat LICENSES
- Uglify or pipe for user
- Gulp task
- Grunt task
- Add tests

## LICENSE

The MIT License (MIT)

Copyright (c) 2014 mizchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
