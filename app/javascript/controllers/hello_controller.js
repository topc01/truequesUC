import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Si lees esto tenemos un 7 :)"
  }
}
