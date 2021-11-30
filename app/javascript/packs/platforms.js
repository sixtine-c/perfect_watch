const platformColor = () => {
  const platformNetflix = document.getElementById('search_platform_netflix')
  if (platformNetflix) {
    platformNetflix.classList.remove('platform-btn')
    platformNetflix.classList.add('platform-netflix')
  }
  const platformPrimeVideo = document.getElementById('search_platform_prime_video')
  if (platformPrimeVideo) {
    platformPrimeVideo.classList.remove('platform-btn')
    platformPrimeVideo.classList.add('platform-prime-video')
  }
  const platformAppleTV = document.getElementById('search_platform_apple_tv')
  if (platformAppleTV) {
    platformAppleTV.classList.remove('platform-btn')
    platformAppleTV.classList.add('platform-appletv')
  }
  const platformDisney = document.getElementById('search_platform_disney_')
  if (platformDisney) {
    platformDisney.classList.remove('platform-btn')
    platformDisney.classList.add('platform-disney')
  }
};

export { platformColor };
