import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = [
    "pendingTab",
    "acceptedTab",
    "rejectedTab",
    "pendingContent",
    "acceptedContent",
    "rejectedContent"
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
      this.rejectedContentTarget.classList.add("hidden");
      // Modify pending tab
      this.pendingTabTarget.classList.add(...this.activeClasses);
      this.pendingTabTarget.classList.remove(...this.inactiveClasses);
      // Modify accepted tab
      this.acceptedTabTarget.classList.remove(...this.activeClasses);
      this.acceptedTabTarget.classList.add(...this.inactiveClasses);
      // Modify rejected tab
      this.rejectedTabTarget.classList.remove(...this.activeClasses);
      this.rejectedTabTarget.classList.add(...this.inactiveClasses);
    } else if (e.currentTarget.dataset.name === "accepted") {
      // Modify content
      this.acceptedContentTarget.classList.remove("hidden");
      this.pendingContentTarget.classList.add("hidden");
      this.rejectedContentTarget.classList.add("hidden");
      // Modify pending tab
      this.pendingTabTarget.classList.add(...this.inactiveClasses);
      this.pendingTabTarget.classList.remove(...this.activeClasses);
      // Modify accepted tab
      this.acceptedTabTarget.classList.add(...this.activeClasses);
      this.acceptedTabTarget.classList.remove(...this.inactiveClasses);
      // Modify rejected tab
      this.rejectedTabTarget.classList.add(...this.inactiveClasses);
      this.rejectedTabTarget.classList.remove(...this.activeClasses);
    } else if (e.currentTarget.dataset.name === "rejected") {
      // Modify content
      this.rejectedContentTarget.classList.remove("hidden");
      this.acceptedContentTarget.classList.add("hidden");
      this.pendingContentTarget.classList.add("hidden");
      // Modify pending tab
      this.pendingTabTarget.classList.add(...this.inactiveClasses);
      this.pendingTabTarget.classList.remove(...this.activeClasses);
      // Modify accepted tab
      this.acceptedTabTarget.classList.add(...this.inactiveClasses);
      this.acceptedTabTarget.classList.remove(...this.activeClasses);
      // Modify rejected tab
      this.rejectedTabTarget.classList.add(...this.activeClasses);
      this.rejectedTabTarget.classList.remove(...this.inactiveClasses);
    }
  }
}
