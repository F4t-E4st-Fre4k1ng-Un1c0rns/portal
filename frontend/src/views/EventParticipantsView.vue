<script setup lang="ts">
  import { useAttrs, ref } from 'vue';

  import type Ticket from '@/types/ticket'
  import { type DatabaseEvent } from '@/types/event'

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

</script>

<template>
  <section>
    <select>
      <option disabled default></option>
    </select>
  </section>
</template>
