import { Controller } from "@hotwired/stimulus";
import hljs from "highlight.js";

export default class extends Controller {
  static targets = ["editor", "preview"];

  connect() {
    hljs.configure({
      ignoreUnescapedHTML: true,
    });
  }

  fillIn() {
    const content = this.editorTarget.editor.getDocument().toString();
    this.previewTarget.innerHTML = content;
    hljs.highlightElement(this.previewTarget);
    this.previewTarget.classList.remove("language-undefined");
    this.previewTarget.classList.add("language-rb");
  }
}
