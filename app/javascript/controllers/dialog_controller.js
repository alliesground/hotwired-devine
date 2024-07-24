import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dialog"
export default class extends Controller {

  connect() {
    this.open()
  }

  open() {
    this.element.showModal()
    document.body.classList.add('overflow-hidden')
  }

  close() {
    this.element.remove()
    document.body.classList.remove('overflow-hidden')
    console.log("closing")
  }
}
