const { environment } = require('@rails/webpacker');

module.exports = environment;

const webpack = require('webpack');
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    "window.jQuery": "jquery",
    Popper: 'popper.js'
  })
);

