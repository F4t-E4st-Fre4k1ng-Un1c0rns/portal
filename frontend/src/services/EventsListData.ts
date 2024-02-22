import { type EventBasic } from '@/types/event'

async function getData(): Promise<EventBasic[]> {
  const out = []
  out.push({
    id: '123',
    name: 'Самарский полумарафон «В беге мы едины»',
    about_event: '',
    banner: (await import('@/assets/images/tempory-assets/cyclist.jpg')).default,
    place: { country: { name: '' }, address: 'г. Самара' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 2, 3)
  })
  out.push({
    id: '124',
    name: 'Саратовский полумарафон «В беге мы едины»',
    about_event: '',
    banner: (await import('@/assets/images/tempory-assets/hockey.jpg')).default,
    place: { country: { name: '' }, address: 'г. Саратов' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(1, 3, 3)
  })
  out.push({
    id: '123',
    name: 'Сыктывкарский полумарафон «В беге мы едины»',
    about_event: '',
    banner: (await import('@/assets/images/tempory-assets/marathon.jpg')).default,
    place: { country: { name: '' }, address: 'г. Сыктывкар' },
    sport_type: { id: '', name: 'бег' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(2, 2, 3)
  })
  out.push({
    id: 'error',
    name: 'Неработающее событие',
    about_event: 'Оно сломалось))))))))))))))))',
    banner: (await import('@/assets/images/tempory-assets/error.webp')).default,
    place: { country: { name: '' }, address: 'Дальневосточный федеральный университет' },
    sport_type: { id: '', name: 'спортивное программирование' },
    target_group: { gender: '', minimal_age: 0 },
    participation_start: new Date(1, 2, 3),
    participation_end: new Date(2, 2, 3)
  })
  return out
}

export { getData }

