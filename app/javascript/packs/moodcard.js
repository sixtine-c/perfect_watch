const moodPic = () => {
  // Mood beer party
  const moodBeerParty = document.getElementById('search_mood_bière__pizza')
  if(moodBeerParty) {
    moodBeerParty.parentElement.classList.add('mood_beer_party')
  }
  // Mood cold blood
  const moodThriller = document.getElementById('search_mood_whats_in_the_box_')
  if(moodThriller) {
    moodThriller.parentElement.classList.add('mood_thriller')
  }
  // Mood history
  const moodHistory = document.getElementById('search_mood_retour_vers_le_passé')
  if(moodHistory) {
    moodHistory.parentElement.classList.add('mood_history')
  }
  // Mood cocooning
  const mood_cocooning = document.getElementById('search_mood_cocooning')
  if(mood_cocooning) {
    mood_cocooning.parentElement.classList.add('mood_cocooning')
  }
  // Mood Ben & Jerry's and cry
  const moodIcecream = document.getElementById('search_mood_ben__jerrys__cry')
  if(moodIcecream) {
    moodIcecream.parentElement.classList.add('mood_icecream')
  }
  // Mood Kids friendly
  const moodKids = document.getElementById('search_mood_kids_friendly')
  if(moodKids) {
    moodKids.parentElement.classList.add('mood_kids')
  }
  // Mood Not ready to sleep
  // const moodHorror = document.getElementById('search_mood_whats_in_the_box_')
  // if(moodHorror) {
  //   moodHorror.parentElement.classList.add('mood_horror')
  // }
  // Mood I'm going on an adventure
  const moodAdventure = document.getElementById('search_mood_im_going_on_an_adventure_')
  if(moodAdventure) {
    moodAdventure.parentElement.classList.add('mood_adventure')
  }
}
export { moodPic }
