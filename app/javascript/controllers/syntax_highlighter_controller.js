import { Controller } from "@hotwired/stimulus";
import MarkdownIt from "markdown-it";
import hljs from "highlight.js";

export default class extends Controller {
  static values = {
    content: String,
  };

  connect() {
    this.md = new MarkdownIt();
    const content = this.contentValue;
    const result = this.md.render(content);
    this.element.innerHTML = result;
    hljs.highlightAll();
  }
}
