import { type DatabaseEvent } from '@/types/event'

async function fetchData(id: string): Promise<DatabaseEvent> {
  let request = await fetch(`${import.meta.env.VITE_EVENTS_BASE_API}/events/${id}`)
  let response = await request.json()
  response.participation_start = new Date(response.participation_start)
  response.participation_end = new Date(response.participation_end)
  response.regestration_start = new Date(response.regestration_start)
  response.regestration_end = new Date(response.regestration_end)
  return response
}

export { fetchData }
