import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ['toast'];

  connect() {
    if (this.hasToastTarget) {
      setTimeout(() => {
        this.hideToast();
      }, 3000); 
    }
  }

  hideToast() {
    this.toastTarget.remove();
  }
}

