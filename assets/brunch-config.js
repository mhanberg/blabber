exports.config = {
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },
  conventions: {
    assets: /^(static)/
  },
  paths: {
    watched: ["static", "css", "js", "vendor"],
    public: "../priv/static"
  },
  plugins: {
    babel: {
      ignore: [/vendor/]
    },
    postcss: {
      processors: [
        require('tailwindcss')('./tailwind.js')
      ]
    }
  },
  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },
  npm: {
    enabled: true
  }
};
