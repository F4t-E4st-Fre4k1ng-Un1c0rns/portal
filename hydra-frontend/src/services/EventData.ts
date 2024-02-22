import { type DatabaseEvent } from '@/types/event'
import type Ticket from '@/types/ticket'

function generateMockTickets(): Ticket[] {
  const groups = [
    'Этап Кубка России по триатлону',
    'Чемпионат Приморского края, Любители',
    'Любители'
  ]
  // const distances = ['113 км', 'олимпийская', '64 байта', '-19 °C'] // i found this funny 
  const tickets = []
  for (let i = 0; i < 12; ++i) {
    tickets.push({
      id: `${i}`,
      description: 'Триатлон',
      max_places: Math.floor(Math.random() * 100 + 1),
      price: Math.floor(Math.random() * 10000 + 1),
    })
  }
  return tickets
}

async function getMockData(id: string): Promise<DatabaseEvent> {
  if (id == "error") {
    throw Error
  }
  return {
    id: id,
    banner: (await import('@/assets/images/tempory-assets/cyclist.jpg')).default,
    name: 'Триатлон «Де-Фриз 113». Соревнования по триатлону среди любителей и профессионалов на средней и стандартной дистанции.',
    about_event:
      '<p>Главное событие по триатлону состоится во Владивостоке, в историческом месте, на полуострове Де-Фриз.</p><p><b>Гонка «Де-Фриз 113»</b> уже во второй раз пройдёт по живописным местам пригорода Владивостока. Беговой участок будет проходить по Низководному мосту, который соединяет полуостров Де-Фриз с городом Владивосток.</p><p>Спортивное событие проходит при поддержке Министерства физической культуры и спорта, Администрации Приморского края, Федераций триатлона России и Федераций триатлона Приморского края.</p>',
    place: {
      country: {
        name: 'Россия'
      },
      address: 'г. Владивосток, Де-Фриз'
    },
    sport_type: {
      id: '1',
      name: 'Триатлон'
    },
    target_group: {
      gender: 'мужчины, женщины, etc.',
      minimal_age: 123
    },
    starter_items: [ { name: 'мем про котов' }, { name: '(по ржать)' } ],
    articles: [ 
      { title: 'Как ржатб с мемов про котов', text: 'смешно' },
      { title: 'Как не ржатб с мемов про котов', text: 'не смешно' },
    ],
    documents: [{ file: 'https://vk.com/memy_pro_kotow' }],
    registration_start: new Date(2020, 1, 2),
    regestration_end: new Date(2020, 1, 2),
    participation_start: new Date(2020, 1, 2),
    participation_end: new Date(2020, 1, 2),
    tickets: generateMockTickets()
  }
}

async function getEventById(id: string): Promise<DatabaseEvent> {
  return await getMockData(id)
}

export { getEventById }
