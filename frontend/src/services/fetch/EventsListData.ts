import { type EventBasic } from '@/types/event'

async function fetchData(): Promise<EventBasic[]> {
  let request = await fetch(`${import.meta.env.VITE_EVENTS_BASE_API}/events`)
  let events = await request.json()

  events.forEach((e: EventBasic) => {
    e.participation_start = new Date(e.participation_start)
    e.participation_end = new Date(e.participation_end)
  })

  return events
}

export { fetchData }
