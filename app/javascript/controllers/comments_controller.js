import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {}
    
  connect() {}

  toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();
    
    const textAreaID = event.params["form"]
    const commentBodyID = event.params["body"]

    const editCommentTextArea = document.getElementById(textAreaID)
    const commentBody = document.getElementById(commentBodyID)

    this.toggleEditButton(event)
    
    editCommentTextArea.classList.toggle("d-none")
    commentBody.classList.toggle("d-none")
  }

  toggleEditButton(event) {
    const editButtonId = event.params["editButton"]
    const editButton = document.getElementById(editButtonId)

    editButton.classList.toggle("btn-warning")
    editButton.classList.toggle("btn-secondary")
    editButton.innerHTML = editButton.innerHTML == "Edit" ? "Cancel" : "Edit"
  }
}
