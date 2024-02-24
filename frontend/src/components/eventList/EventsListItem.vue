<script setup lang="ts">
import { ref } from 'vue'

import { type EventBasic } from '@/types/event'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'
import { usePopupsStore } from '@/stores/popups'

const popupsStore = usePopupsStore()
let props = defineProps<{
  event: EventBasic
}>()

let selectedTicket = ref<number>(0)

const openRegistrationPopup = () => {
  Object.assign(popupsStore.ticket, props.event.tickets[selectedTicket.value])
  Object.assign(popupsStore.event, props.event)
  popupsStore.eventRegisterPopupOpened = true
}
</script>

<template>
  <div class="card shadow">
    <router-link class="banner" :style="`background-image: url(${event.banner});`"
      :to="{ name: 'event-overview', params: { id: event.id } }">
      <p class="sport-name">{{ event.sport_type.name }}</p>
    </router-link>
    <div class="info">
      <router-link class="name"
        :to="{ name: 'event-overview', params: { id: event.id } }">
        {{ event.title }}
      </router-link>
      <select class="ticket-select" v-model="selectedTicket">
        <option v-for="(ticket, index) in event.tickets" :key="ticket.id" :value="index">{{ ticket?.title }}</option>
      </select>
      <p class="price">{{ event.tickets[selectedTicket]?.price }} ₽</p>
      <div class="date-and-time">
        <p>
          <time :datetime="event.participation_start.toISOString()" class="icon">
            {{ dateStartAndEndToHumanReadableConverter(event.participation_start, event.participation_end) }}
          </time>
        </p>
        <p class="icon location">{{ event.place.address }}</p>
      </div>
      <button class="button"
        @click="() => { openRegistrationPopup() }">
        Регистрация
      </button>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/styles/events-list-item.css);
</style>
