import { type EventBasic } from '@/types/event'
import { generateMockTickets } from './mocking/tickets'

function getData(): EventBasic[] {
  const out = []
  out.push({
    id: '123',
    title: 'Самарский полумарафон «В беге мы едины»',
    about_event: '',
    banner: '/src/assets/images/tempory-assets/cyclist.jpg',
    place: { country: { name: '' }, address: 'г. Самара' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 2, 4),
    tickets: generateMockTickets()
  })
  out.push({
    id: '124',
    title: 'Саратовский полумарафон «В беге мы едины»',
    about_event: '',
    banner: '/src/assets/images/tempory-assets/hockey.jpg',
    place: { country: { name: '' }, address: 'г. Саратов' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 3, 3),
    tickets: generateMockTickets()
  })
  out.push({
    id: '123',
    title: 'Сыктывкарский полумарафон «В беге мы едины»',
    about_event: '',
    banner: '/src/assets/images/tempory-assets/marathon.jpg',
    place: { country: { name: '' }, address: 'г. Сыктывкар' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(2, 2, 3),
    tickets: generateMockTickets()
  })
  return out
}

export { getData }

