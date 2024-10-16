import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
    
  connect() {}

  toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();
    
    const formID = event.params["form"]
    const bodyID = event.params["body"]

    const formElement = document.getElementById(formID)
    const bodyElement = document.getElementById(bodyID)

    formElement.classList.toggle("d-none")
    bodyElement.classList.toggle("d-none")
  }
}
