import { reactive, ref } from 'vue'
import { defineStore } from 'pinia'
import { type EventBasic } from '@/types/event'
import type Ticket from '@/types/ticket'

export const usePopupsStore = defineStore('popups', () => {
  const loginPopupOpened = ref(false)
  const eventRegisterPopupOpened = ref(false)
  const event = reactive<EventBasic>({
    id: '',
    banner: '',
    title: '',
    place: { country: { name: '' }, address: '' },
    tickets: [],
    participation_start: new Date(),
    participation_end: new Date(),
    sport_type: { id: '', name: '' }
  })
  const ticket = reactive<Ticket>({
    id: '',
    price: 0,
    title: '',
    extra_title: '',
    max_places: 0
  })


  return { loginPopupOpened, eventRegisterPopupOpened, event, ticket }
})
