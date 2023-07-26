import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  initialize () {
    console.log ("test")
  }

  hide() {
    this.modalTarget.style.display = "none"
  }

 
}
