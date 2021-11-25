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
    const moodList = ['beer-party', 'thriller', 'history', 'kids', 'icecream', 'adventure', 'cocooning', 'horror']

    const colors = { 'search_mood_bière__pizza': moodList[0],
                      'search_mood_whats_in_the_box_': moodList[1],
                      'search_mood_retour_vers_le_passé': moodList[2],
                      'search_mood_kids_friendly': moodList[3],
                      'search_mood_ben__jerrys__cry': moodList[4],
                      'search_mood_im_going_on_an_adventure_': moodList[5],
                      'search_mood_cocooning': moodList[6] }
    const target_id = event.currentTarget.id;
    const class_color = colors[target_id];

    this.bgcolorTargets.forEach(element => {
      moodList.forEach(mood => {
        element.classList.remove(mood)
      });
      element.classList.add(class_color)
    });
  }
}
