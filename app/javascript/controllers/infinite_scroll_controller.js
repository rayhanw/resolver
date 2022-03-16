import { Controller } from "@hotwired/stimulus";
import { useIntersection } from "stimulus-use";

export default class extends Controller {
  static targets = ["list", "trigger", "card"];
  static values = {
    offset: Number,
    lastErrorId: Number,
    initialText: String,
    loadingText: String,
    noMoreText: String
  };
  static classes = ["disabled"];

  connect() {
    this.offset = 3;
    this.hasMore = true;
    useIntersection(this, { element: this.triggerTarget, rootMargin: "2px" });
  }

  appear() {
    if (this.hasMore) {
      this.#loadMore();
    }
  }

  #loadMore() {
    this.triggerTarget.innerText = this.loadingTextValue;
    const options = {
      headers: {
        Accept: "text/plain"
      }
    };
    fetch(`/?offset=${this.offset}`, options)
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.insertAdjacentHTML("beforeend", data);
        this.offset += 3;

        const pattern = new RegExp(`error-${this.lastErrorIdValue}`);
        this.hasMore = !pattern.test(data);

        if (this.hasMore) {
          this.triggerTarget.innerText = this.initialTextValue;
        } else {
          this.triggerTarget.setAttribute("disabled", "");
          this.triggerTarget.innerText = this.noMoreTextValue;
          this.triggerTarget.classList.add(...this.disabledClasses);
        }
      });
  }
}
