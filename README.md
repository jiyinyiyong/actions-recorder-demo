
Actions Recorder Demo
----

Demo http://repo.tiye.me/actions-recorder-demo

### Usage

Read in `src/` to see how `actions-recorder` works.

### Develop

```text
npm i
```

You need a static file server for the HTML files. Personally I suggest using Nginx.

Develop:

```bash
gulp html # regenerate index.html
webpack-dev-server --hot # enable live-reloading
```

Build (Pack and optimize js, reivision js and add entry in `index.html`):

```bash
gulp build
```

# Theme

http://desktopinhq.com/images/big/compass-1433192.jpg

### License

MIT
