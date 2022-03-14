import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["list"];
	static values = {
		offset: Number
	};

	connect() {
		console.log("connected");
	}

	loadMore() {
		const options = {
			headers: {
				Accept: "text/plain"
			}
		};
		const offset = this.offsetValue + 3;
		fetch(`/?offset=${offset}`, options)
			.then(response => response.text())
			.then(data => {
				this.listTarget.insertAdjacentHTML("beforeend", data);
			});
	}
}
