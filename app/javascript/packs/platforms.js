const platformColor = () => {
  const platform = document.getElementById('search_platform_netflix')
  if (platform) {
    platform.classList.remove('platform-btn')
    platform.classList.add('platform-netflix')
  }
};

export { platformColor };
