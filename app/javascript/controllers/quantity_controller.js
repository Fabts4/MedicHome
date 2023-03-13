import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "link"];


  decrement() {
    const oldValue = parseFloat(this.inputTarget.value);
    const newValue = oldValue - 1 >= 1 ? oldValue - 1 : 1;
    this.inputTarget.value = newValue;
    this.updateLinkHref(newValue);

  }

  increment() {
    const oldValue = parseFloat(this.inputTarget.value);
    const newValue = oldValue + 1;
    this.inputTarget.value = newValue;
    this.updateLinkHref(newValue);
  }

  updateQuantity() {
    const quantity = this.inputTarget.value;
    const newHref = this.linkTarget.href.replace(/quantity=\d+/, `quantity=${quantity}`);
    this.linkTarget.setAttribute('href', newHref);
  }

  updateLinkHref(quantity) {
    const newHref = this.linkTarget.href.replace(/quantity=\d+/, `quantity=${quantity}`);
    this.linkTarget.setAttribute('href', newHref);
  }
}
