import { Controller } from "@hotwired/stimulus";
import hljs from "highlight.js";

export default class extends Controller {
  connect() {
    console.log("Hello world");
    hljs.highlightAll();
  }
}
