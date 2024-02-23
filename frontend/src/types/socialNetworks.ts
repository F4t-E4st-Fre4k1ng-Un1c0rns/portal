interface DatabaseSocialLink {
  link: string
}

interface SocialNetwork {
  readonly regex: RegExp
  readonly icon: string
  readonly alt_text: string
}

interface SocialNetworkLink {
  network: SocialNetwork,
  link: string
}

const Vk: SocialNetwork = {
  regex: /vk.com/,
  icon: (await import('@/assets/images/icons/vk.svg')).default,
  alt_text: 'Страница во Вконтакте'
}

const Telegram = {
  regex: /t.me/,
  icon: (await import('@/assets/images/icons/telegram.svg')).default,
  alt_text: 'Канал в Telegram'
}

const Website = {
  regex: /.*/,
  icon: 'web.svg',
  alt_text: 'Сайт'
}

const socialNetworks: SocialNetwork[] = [Vk, Telegram]

function determineSocialNetwork(link: DatabaseSocialLink): SocialNetworkLink {
  for (let i = 0; i < socialNetworks.length; ++i) {
    if (socialNetworks[i].regex.test(link.link)) {
      return {
        network: socialNetworks[i],
        link: link.link
      }
    }
  }
  return {
    network: Website,
    link: link.link
  }
}

export { determineSocialNetwork, type DatabaseSocialLink }

