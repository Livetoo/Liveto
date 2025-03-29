/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    screens: {
      sm: '320px',
      md: '500px',
      lg: '1024px',
      xl: '1280px'
    },
    extend: {},
  },
  plugins: [],
}

