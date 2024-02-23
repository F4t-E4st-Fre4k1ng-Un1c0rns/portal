import type Ticket from '@/types/ticket'

function generateMockTickets(): Ticket[] {
  // const distances = ['113 км', 'олимпийская', '64 байта', '-19 °C'] // i found this funny 
  const tickets = []
  for (let i = 0; i < 12; ++i) {
    tickets.push({
      id: `${i}`,
      title: 'Триатлон',
      extra_title: 'Триатлон',
      max_places: Math.floor(Math.random() * 100 + 1),
      price: Math.floor(Math.random() * 10000 + 1),
    })
  }
  return tickets
}


export { generateMockTickets }

