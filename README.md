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

# TODO

- Sort by its dependent
- Concat LICENSES
- Uglify or pipe for user
- Gulp task
- Grunt task
- Add tests
