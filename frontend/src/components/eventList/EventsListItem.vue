<script setup lang="ts">
import { ref } from 'vue'

import { type EventBasic } from '@/types/event'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'
import EventRegistrationPopup from '@/components/popups/EventRegistrationPopup.vue';

let props = defineProps<{
  event: EventBasic
}>()

let registrationPopup = ref<typeof EventRegistrationPopup | undefined>()

let selectedTicket = ref<number>(0)
console.log(props.event.tickets, selectedTicket.value)
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
        @click="() => { registrationPopup.openDialog() }">
        Регистрация
      </button>
      <EventRegistrationPopup
        :event="event" :ticket="event.tickets[selectedTicket]"
        ref="registrationPopup" v-if="event.tickets[selectedTicket]" />
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/styles/events-list-item.css);
</style>
