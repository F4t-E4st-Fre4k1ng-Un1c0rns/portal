import { computed, reactive, ref, watch } from 'vue'
import { defineStore } from 'pinia'
import { type EventBasic } from '@/types/event'
import type Ticket from '@/types/ticket'
import { useRouter, type RouteLocationNormalized } from 'vue-router'

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

  const viewName = ref('')
  const eventName = ref('')
  const title = computed(() => {
    if (loginPopupOpened.value) {
      return `Вход`
    } else if (eventRegisterPopupOpened.value) {
      return `Регистрация на ${event.title}`
    } else if (eventName.value.length > 0) {
      return `${eventName.value}`
    } else {
      return `${viewName.value}`
    }
  })

  const setTitle = () => {
    document.title = title.value
  }

  watch(title, () => {
    setTitle()
  })
  setTitle()

  const router = useRouter()
  router.afterEach((to: RouteLocationNormalized) => {
    viewName.value = to.meta.title || ""
  })


  return { loginPopupOpened, eventRegisterPopupOpened, event, ticket,
    viewName, eventName, title  
  }
})
