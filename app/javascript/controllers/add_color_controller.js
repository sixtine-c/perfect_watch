// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "bgcolor" ]
  static values = { color: String }

  changecolor(event) {
    const moodList = ['beer-party', 'history', 'thriller', 'kids', 'adventure', 'cocooning', 'icecream', 'horror']
    this.bgcolorTargets.forEach(element => {
      moodList.forEach(mood => {
        if (element.classList.contains(mood)) {
          element.classList.remove(mood)
        }
      });
      element.classList.add(event.currentTarget.dataset.color)
    });
  }
}
