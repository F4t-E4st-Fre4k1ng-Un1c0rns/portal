import { type EventBasic } from '@/types/event'
import { type FetchingModule } from '@/types/fetchingModule'

let fetchingModule: undefined | FetchingModule = undefined
if (import.meta.env.VITE_MOCKING) {
  fetchingModule = await import('./mocking/EventsListData')
} else {
  fetchingModule = await import('./fetch/EventsListData')
}


function getData(query: string): Promise<EventBasic[]> {
  if (fetchingModule !== undefined) {
    return fetchingModule.fetchData(query)
  }
  throw Error
}

export { getData }

