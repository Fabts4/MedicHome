import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-item"
export default class extends Controller {

  static targets = ["checkoutCart", "navbar", "cartIcon", "pastille"]

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
        // this.navbarTarget.innerText = data.cartItemsCount;
        // this.cartIconTarget.style.color = 'red';
        // setTimeout(() => {
        //   this.cartIconTarget.style.color = 'white';
        // }, 400);
        this.pastilleTarget.innerText = data.cartItemsCount
        this.pastilleTarget.classList.remove("d-none")
        this.pastilleTarget.classList.add("scale")
        setTimeout(() => {
          this.pastilleTarget.classList.remove("scale");
        }, 500 )
      })

  }

}
