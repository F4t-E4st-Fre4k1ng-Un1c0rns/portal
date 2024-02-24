import { type User } from '@/types/user'

async function fetchData(ticket_id: string): Promise<User[]> {
  let request = await fetch(`${import.meta.env.VITE_EVENTS_BASE_API}/registrations/${ticket_id}`)
  let response = await request.json()
  for (let i = 0; i < response.length; ++i) {
    response[i].dateOfBirth = new Date(response[i].dateOfBirth)
  }
  return response
}

export { fetchData }

