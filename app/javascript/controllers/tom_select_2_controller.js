import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="tom-select"
export default class extends Controller {
  connect() {
    new TomSelect(this.element, {
      create: true,
      placeholder: "Sélectionner un médicament...",
      sortField: {
        field: "text",
        direction: "asc"
      },
    })
  }
}
