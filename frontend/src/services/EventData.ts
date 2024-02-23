import { type DatabaseEvent } from '@/types/event'
import { type FetchingModule } from '@/types/fetchingModule'

let fetchingModule: undefined | FetchingModule = undefined
if (import.meta.env.VITE_MOCKING) {
  fetchingModule = await import('./mocking/EventData')
} else {
  fetchingModule = await import('./fetch/EventData')
}


function getEventById(id: string): Promise<DatabaseEvent> {
  return fetchingModule?.fetchData(id)
}

export { getEventById }
