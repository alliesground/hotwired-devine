import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-completion-form"
export default class extends Controller {
  submit() {
    this.element.submit()
  }
}
