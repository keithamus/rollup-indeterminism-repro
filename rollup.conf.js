export default {
  plugins: [
    {
      resolveId: function() {
        return new Promise(function(resolve) {
          setTimeout(function() {
            resolve(null)
          }, Math.random() * 100)
        })
      }
    }
  ],
  input: 'index.js',
  output: {
    dir: 'dist',
    entryFileNames: '[name]-[hash].js',
    format: 'es',
  },
}
