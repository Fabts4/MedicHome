import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item"
export default class extends Controller {

  static targets = ["checkoutCart", "navbar"]

  connect() {
    console.log()
  }

  create(event) {
    event.preventDefault()

    fetch(event.currentTarget.href, {
      method: "POST",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      }
    })
      .then(response => response.json())
      .then((data) => {
        this.checkoutCartTarget.outerHTML = data.html;
        this.navbarTarget.innerText = data.cartItemsCount;
      })

  }

}
