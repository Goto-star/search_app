const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  jquery: 'jquery/src/jquery'
  // If you need popper uncomment it.
  // Popper: ['popper.js', 'default']
}))

module.exports = environment
