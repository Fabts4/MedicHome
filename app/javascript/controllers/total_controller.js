import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["finalPrice", "checkbox"]

  updateTotal() {

    if (this.checkboxTarget.checked === true ) {
      this.finalPriceTarget.innerHTML = parseInt(this.finalPriceTarget.innerText) + 5
    } else {
      this.finalPriceTarget.innerHTML = parseInt(this.finalPriceTarget.innerText) - 5
    }
  }
}
