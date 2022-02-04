import { Controller } from 'stimulus';
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  // declaration of target names for the controller
  static targets = ['items', 'form'];


  send(event) {
    event.preventDefault();
    console.log(this.formTarget.action);
    //AJAX request
    // fetch(grab the URL from our form. Using .action gives us value of the action attribute)
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': 'application/json', 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
// connect() {
//   console.log(this.itemsTarget);
//   console.log(this.formTarget);
// }
