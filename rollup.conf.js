import resolve from 'rollup-plugin-node-resolve'
export default {
  plugins: [
    // node-resolve plugin is technically not needed, but it triggers the bug
    resolve({
      module: true,
      jsnext: false,
      browser: false,
    }),
  ],
  input: 'index.js',
  output: {
    dir: 'dist',
    entryFileNames: '[name]-[hash].js',
    format: 'es',
  },
}
