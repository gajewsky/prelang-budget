import application from "stimulus_application";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "./bill_item.css";

const context = require.context('./', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
