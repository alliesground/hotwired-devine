import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log(`Hello, ${this.identifier}`);
  }

  submit(event) {
    console.log(event.data)
    setTimeout(() => this.element.requestSubmit(), 500)
  }
}
