const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  mode: "jit",
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Roboto", ...defaultTheme.fontFamily.sans],
        code: ["Fira Code", "Roboto", ...defaultTheme.fontFamily.sans]
      },
      colors: {
        black: "rgba(42, 42, 42, 1)",
        gray: {
          custom: "#3C3C3C",
          light: "#F1FAEE"
        }
      },
      backgroundPosition: {
        "center-custom": "12px center"
      },
      screens: {
        lg: "1280px",
        xl: "1440px"
      }
    }
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography")
  ]
};
