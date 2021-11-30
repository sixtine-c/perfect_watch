import { end } from '@popperjs/core';
import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['button']




  connect() {
    setTimeout(() => this.buttonTarget.classList.remove('disabled'), 10000)
  }
}
