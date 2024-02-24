import { type EventBasic } from '@/types/event'
import { generateMockTickets } from './tickets'

async function fetchData(): Promise<EventBasic[]> {
  const out: EventBasic[] = []
  out.push({
    id: '123',
    title: 'Самарский полумарафон «В беге мы едины»',
    banner: (await import('@/assets/images/tempory-assets/velik.jpg')).default,
    place: { country: { name: '' }, address: 'г. Самара' },
    sport_type: { id: '', name: 'бег' },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 2, 3),
    tickets: generateMockTickets()
  })
  out.push({
    id: '124',
    title: 'Саратовский полумарафон «В беге мы едины»',
    banner: (await import('@/assets/images/tempory-assets/marathon.jpg')).default,
    place: { country: { name: '' }, address: 'г. Саратов' },
    sport_type: { id: '', name: 'бег' },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 3, 3),
    tickets: generateMockTickets()
  })
  out.push({
    id: '123',
    title: 'Сыктывкарский полумарафон «В беге мы едины»',
    banner: (await import('@/assets/images/tempory-assets/marathon.jpg')).default,
    place: { country: { name: '' }, address: 'г. Сыктывкар' },
    sport_type: { id: '', name: 'бег' },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(2, 2, 3),
    tickets: generateMockTickets()
  })
  out.push({
    id: 'error',
    title: 'Неработающее событие',
    banner: (await import('@/assets/images/tempory-assets/error.webp')).default,
    place: { country: { name: '' }, address: 'Дальневосточный федеральный университет' },
    sport_type: { id: '', name: 'спортивное программирование' },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(2, 2, 3),
    tickets: generateMockTickets()
  })
  return out
}

export { fetchData }


