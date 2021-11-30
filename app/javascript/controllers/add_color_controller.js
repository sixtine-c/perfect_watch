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
    if (event.currentTarget.id !== "search_mood_random") return false ;

    const moodList = ['beer-party', 'thriller', 'history', 'kids', 'icecream', 'adventure', 'cocooning', 'horror'];
    const randomMood = Math.floor(Math.random() * moodList.length);
    const moodPicked = moodList[randomMood] ;
    console.log (randomMood);
    console.log (moodPicked);

    const ids = {
      'beer-party': 'search_mood_beer__pizza',
      'thriller': 'search_mood_cold_blood' ,
      'history': 'search_mood_time_flies',
      'kids': 'search_mood_kids_friendly',
      'icecream': 'search_mood_ben__jerrys__cry',
      'adventure': 'search_mood_im_going_on_an_adventure_',
      'cocooning': 'search_mood_cocooning',
      'horror': 'search_mood_not_ready_to_sleep'
    }
    const idPicked = (ids[moodPicked]);
    console.log(idPicked);

    const elementMoodPicked = document.getElementById(idPicked);
    const elementMoodRandom = document.getElementById("search_mood_random");
    elementMoodPicked.checked = true;

    elementMoodPicked.remove("hiddenbox");
    elementMoodPicked.classList.add("random-mood");
    // elementMoodRandom.remove("hiddenbox");
    // elementMoodRandom.classList.add("hiddenbox");



    // Pick a mood at random
    // check chosen mood radio button
    // change css on random but to appear as checked
    // change css on selected radio button to appear as not checked
  }
}
