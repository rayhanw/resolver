import { Controller } from "@hotwired/stimulus";
import MarkdownIt from "markdown-it";
import hljs from "highlight.js";

export default class extends Controller {
  static targets = ["editor", "preview"];
  static values = {
    load: Number
  };

  connect() {
    this.md = new MarkdownIt();
    if (this.previewTarget.dataset.load) {
      this.#loadInitialPreview();
    }
  }

  fillIn(e) {
    const content = e.target.value;
    this.#loadHighlight(content);
  }

  #loadInitialPreview() {
    const content = this.editorTarget.value;
    this.#loadHighlight(content);
  }

  #loadHighlight(content) {
    const result = this.md.render(content);
    this.previewTarget.innerHTML = result;
    hljs.highlightAll();
  }
}
