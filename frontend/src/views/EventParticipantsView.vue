<script setup lang="ts">
  import { useAttrs, ref, watch } from 'vue';
  import { useRoute } from 'vue-router';

  import type Ticket from '@/types/ticket'
  import { type DatabaseEvent } from '@/types/event'
  import router from '@/router';

  const route = useRoute()
  let event: DatabaseEvent | undefined = undefined
  let tickets: Ticket[] | undefined = undefined
  const loaded = ref(false)
  const attrs = useAttrs()

  if (typeof attrs.event === "object" && attrs.event !== null && "tickets" in attrs.event) {
    event = attrs.event as DatabaseEvent
    tickets = event.tickets as Ticket[]
    loaded.value = true
  } else {
    console.error(attrs)
    throw Error
  }

  const selectedTicket = ref(route.params.ticket_id || '')

  watch(selectedTicket, () => {
    router.push({ 
      name: 'event-participants-list', 
      params: { id: event?.id, ticket_id: selectedTicket.value } 
    })
  })
</script>

<template>
  <section class="select">
    <select v-model="selectedTicket" class="ticket-select shadow">
      <option disabled selected value="">Выберете соревнование</option>
      <option v-for="ticket in tickets" :key="ticket.id" :value="ticket.id">{{ ticket.title }}</option>
    </select>
    <RouterView />
  </section>
</template>

<style scoped>
@import url(@/assets/styles/event-participants.css);
</style>
