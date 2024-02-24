import { type User } from '@/types/user'
import { type FetchingModule } from '@/types/fetchingModule'

let fetchingModule: undefined | FetchingModule = undefined
if (import.meta.env.VITE_MOCKING) {
  fetchingModule = await import('./mocking/EventParticipantsData')
} else {
  fetchingModule = await import('./fetch/EventParticipantsData')
}


function getData(ticket_id: string): Promise<User[]> {
  return fetchingModule?.fetchData(ticket_id)
}

export { getData }
