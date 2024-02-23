import { type DatabaseEvent } from '@/types/event'

import { generateMockTickets } from './tickets'


async function fetchData(id: string): Promise<DatabaseEvent> {
  if (id == "error") {
    throw Error
  }
  return {
    id: id,
    banner: (await import('@/assets/images/tempory-assets/cyclist.jpg')).default,
    title: 'Триатлон «Де-Фриз 113». Соревнования по триатлону среди любителей и профессионалов на средней и стандартной дистанции.',
    about:
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
    starter_items: [ { starter_item: 'мем про котов' }, { starter_item: '(по ржать)' } ],
    articles: [ 
      { title: 'Как ржатб с мемов про котов', text: 'смешно' },
      { title: 'Как не ржатб с мемов про котов', text: 'не смешно' },
    ],
    documents: [{ file: 'https://vk.com/memy_pro_kotow' }],
    registration_start: new Date(2020, 1, 2),
    regestration_end: new Date(2020, 1, 2),
    participation_start: new Date(2020, 1, 2),
    participation_end: new Date(2020, 1, 2),
    tickets: generateMockTickets(),
    social_links: [{ link: 'https://vk.com/memy_pro_kotow' }]
  }
}

export { fetchData }

