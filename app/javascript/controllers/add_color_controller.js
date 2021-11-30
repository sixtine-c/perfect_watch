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
  static targets = [ "bgcolor", "randomMoodField" ]
  static values = { color: String }

  changecolor(event) {
    const moodList = ['beer-party', 'thriller', 'history', 'kids', 'icecream', 'adventure', 'cocooning', 'horror']

    const colors = { 'search_mood_beer__pizza': moodList[0],
                      'search_mood_cold_blood': moodList[1],
                      'search_mood_time_flies': moodList[2],
                      'search_mood_kids_friendly': moodList[3],
                      'search_mood_ben__jerrys__cry': moodList[4],
                      'search_mood_im_going_on_an_adventure_': moodList[5],
                      'search_mood_cocooning': moodList[6],
                      'search_mood_not_ready_to_sleep': moodList[7] }
    const target_id = event.currentTarget.id;
    const class_color = colors[target_id];

    this.bgcolorTargets.forEach(element => {
      moodList.forEach(mood => {
        element.classList.remove(mood)
      });
      element.classList.add(class_color)
    });
  }



  // Une méthode pour remplir le formulaire aka set checked sur 1 des radio buttons
  // Checked field selected at random
  setField(event) {
    if (event.currentTarget.id === "search_mood_random") {
      const moodList = ['beer-party', 'thriller', 'history', 'kids', 'icecream', 'adventure', 'cocooning', 'horror']
      const randomMood = moodList[Math.floor(Math.random() * moodList.length)]
      this.randomMoodFieldTarget.value = randomMood

      this.bgcolorTargets.forEach(element => {
        moodList.forEach(mood => {
          if (mood === randomMood) {
            element.classList.add(mood)
          } else {
            element.classList.remove(mood)
          }
        });
      })
      this.bgcolorTargets.forEach(element => {
        element.classList.add(randomMood)
      })
    } else {
      this.randomMoodFieldTarget.value = null
    }
  }
}
