import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  static values = { placeholder: String }

  connect() {
    new TomSelect(this.element, {
      create: true,
      placeholder: this.placeholderValue,
      sortField: {
        field: "text",
        direction: "asc"
      },
    })
  }
}
