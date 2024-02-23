import type Ticket from './ticket'

interface Place {
  country: { name: string }
  address: string
}

interface Sport {
  id: string
  name: string
}

interface StarterItem {
  starter_item: string
}

interface Article {
  title: string
  text: string
}

interface Document {
  file: string
}

interface SocialLink {
  link: string
}

interface EventBasic {
  id: string
  banner: string
  title: string
  place: Place
  tickets: Ticket[]
  participation_start: Date
  participation_end: Date
  sport_type: Sport
}

interface DatabaseEvent extends EventBasic {
  about: string
  starter_items: StarterItem[]
  articles: Article[]
  documents: Document[]
  registration_start: Date
  regestration_end: Date
  social_links: SocialLink[]
}

export { type DatabaseEvent, type EventBasic }

