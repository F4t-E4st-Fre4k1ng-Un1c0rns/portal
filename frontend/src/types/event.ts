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
  name: string
}

interface Article {
  title: string
  text: string
}

interface Document {
  file: string
}

interface EventBasic {
  id: string
  name: string
  about_event: string
  banner: string

  place: Place
  sport_type: Sport

  target_group: {
    gender: string
    minimal_age: number
  }

  participation_start: Date
  participation_end: Date
}

interface DatabaseEvent extends EventBasic {
  starter_items: StarterItem[]
  articles: Article[]
  documents: Document[]
  registration_start: Date
  regestration_end: Date
  tickets: Ticket[]
}

export { type DatabaseEvent, type EventBasic }

