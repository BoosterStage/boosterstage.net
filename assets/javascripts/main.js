// Load our css
import "../stylesheets/main.scss";

// Utility function to require all files in a directory...
function requireAll(r) {
  r.keys().forEach(r);
}

// Set up Stimulus and import controllers
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
const application = Application.start();
const context = require.context("./controllers/", true, /\.js$/); // eslint-disable-line no-undef
application.load(definitionsFromContext(context));

// Require everything in our modules directory
requireAll(require.context("./modules/", true, /\.js$/)); // eslint-disable-line no-undef
