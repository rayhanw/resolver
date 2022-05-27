import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [
    "pendingTab",
    "acceptedTab",
    "pendingContent",
    "acceptedContent"
  ];
  static values = {
    active: String
  };
  static classes = ["active", "inactive"];

  switchTab(e) {
    if (e.currentTarget.dataset.name === this.activeValue) {
      return;
    }

    this.activeValue = e.currentTarget.dataset.name;

    if (e.currentTarget.dataset.name === "pending") {
      // Modify content
      this.pendingContentTarget.classList.remove("hidden");
      this.acceptedContentTarget.classList.add("hidden");
      // Modify pending tab
      this.pendingTabTarget.classList.add(...this.activeClasses);
      this.pendingTabTarget.classList.remove(...this.inactiveClasses);
      // Modify accepted tab
      this.acceptedTabTarget.classList.remove(...this.activeClasses);
      this.acceptedTabTarget.classList.add(...this.inactiveClasses);
    } else {
      // Modify content
      this.pendingContentTarget.classList.add("hidden");
      this.acceptedContentTarget.classList.remove("hidden");
      // Modify pending tab
      this.pendingTabTarget.classList.remove(...this.activeClasses);
      this.pendingTabTarget.classList.add(...this.inactiveClasses);
      // Modify accepted tab
      this.acceptedTabTarget.classList.add(...this.activeClasses);
      this.acceptedTabTarget.classList.remove(...this.inactiveClasses);
    }
  }
}
