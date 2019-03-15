import resolve from 'rollup-plugin-node-resolve'
export default {
  chunkGroupingSize: 500 * 1024, // 500kb
  plugins: [

    resolve({
      module: true,
      jsnext: false,
      browser: true,
    }),

  ],
  input: 'index.js',
  output: {
    dir: 'dist',
    entryFileNames: '[name]-[hash].js',
    format: 'system',
  },
}
