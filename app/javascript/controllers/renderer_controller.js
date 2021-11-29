import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['display']


  connect() {
    console.log('Hello from movies controller')
  }


  // render(evt) {
  //   this.displayTarget.innerHTML = evt.detail[0].body.innerHTML
  // }

  update() {
    const url = window.location.href

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then(data => this.displayTarget.innerHTML = data);
  }
}
