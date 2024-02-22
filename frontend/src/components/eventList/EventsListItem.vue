<script setup lang="ts">
import { type EventBasic } from '@/types/event'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'

const props = defineProps<{
  event: EventBasic
}>()
</script>

<template>
  <div class="card shadow">
    <div class="banner" :style="`background-image: url(${event.banner});`">
      <p class="sport-name">{{ event.sport_type.name }}</p>
    </div>
    <div class="info">
      <router-link class="name"
        :to="{ name: 'event-overview', params: { id: event.id } }">
        {{ event.name }}
      </router-link>
      <select class="ticket-select">
        <option>Тикеты</option>
      </select>
      <div class="date-and-time">
        <p>
          <time :datetime="event.participation_start.toISOString()" class="icon">
            {{ dateStartAndEndToHumanReadableConverter(event.participation_start, event.participation_end) }}
          </time>
        </p>
        <p class="icon location">{{ event.place.address }}</p>
      </div>
      <router-link class="button" :to="event.id">Регистрация</router-link>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/styles/events-list-item.css);
</style>
