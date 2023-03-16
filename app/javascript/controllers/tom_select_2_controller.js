import { Controller } from "@hotwired/stimulus"
import TomSelect2 from "tom-select-2";

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    new TomSelect2(this.element, {
      create: true,
      placeholder: "Sélectionner un médicament...",
      sortField: {
        field: "text",
        direction: "asc"
      },
    })
  }
}
