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
    let url = `/?offset=${this.offset}`;
    if (location.search.includes("query")) {
      const params = location.search.replace("?", "&");
      url += params;
    }

    fetch(url, options)
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.insertAdjacentHTML("beforeend", data);
        this.offset += 3;

        const pattern = new RegExp(`error-${this.lastErrorIdValue}`);
        if (data.length !== 0) {
          this.hasMore = !pattern.test(data);
        } else {
          this.hasMore = false;
        }

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
