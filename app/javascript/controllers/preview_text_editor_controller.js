import { Controller } from "@hotwired/stimulus";
import MarkdownIt from "markdown-it";
import hljs from "highlight.js";

export default class extends Controller {
  static targets = ["editor", "preview"];

  connect() {
    this.md = new MarkdownIt();
  }

  fillIn(e) {
    const content = e.target.value;
    const result = this.md.render(content);
    console.log(result);
    this.previewTarget.innerHTML = result;
    hljs.highlightAll();
  }
}
