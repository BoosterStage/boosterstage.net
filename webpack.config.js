const webpack = require("webpack");

const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const devMode = process.env.NODE_ENV !== "production";

const path = require("path");

/* global __dirname module process require */

module.exports = {
  entry: {
    main: "./assets/javascripts/main.js"
  },

  resolve: {
    modules: [
      __dirname + "./assets/javascripts",
      __dirname + "./assets/stylesheets",
      path.resolve(__dirname, "node_modules")
    ],
    extensions: [".js", ".css", ".scss"]
  },

  output: {
    path: __dirname + "/build",
    filename: "assets/javascripts/[name].bundle.js"
  },

  plugins: [
    new MiniCssExtractPlugin({
      filename: "assets/stylesheets/[name].bundle.css"
    })
  ],

  module: {
    rules: [
      {
        test: /\.scss$/,

        use: [
          devMode ? 'style-loader' : MiniCssExtractPlugin.loader,
          'css-loader',
          'postcss-loader', 
          'sass-loader'
        ],
      },

      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"],
            plugins: ["@babel/plugin-proposal-class-properties"]
          }
        }
      }
    ]
  }
};
