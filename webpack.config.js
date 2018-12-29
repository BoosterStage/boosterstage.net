const webpack = require("webpack");

const ExtractTextPlugin = require("extract-text-webpack-plugin");

const Clean = require("clean-webpack-plugin");
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
    // new ExtractTextPlugin("style.css")
    new ExtractTextPlugin({
      // filename: "assets/stylesheets/[name].bundle.css"
      filename: devMode
        ? "assets/stylesheets/[name].bundle.css"
        : "assets/stylesheets/[name].[hash].bundle.css"
    })
  ],

  module: {
    rules: [
      {
        test: /\.scss$/,

        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: ["css-loader", "postcss-loader", "sass-loader"]
        })
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
