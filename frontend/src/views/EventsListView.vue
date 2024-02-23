<script setup lang="ts">
import { ref } from 'vue'

import LoadingState from '@/types/loading'
import { type EventBasic } from '@/types/event'
import { getData } from '@/services/EventsListData'
import EventsListItem from '@/components/eventList/EventsListItem.vue'

let loaded = ref(LoadingState.Loading)
let events: EventBasic[] | undefined = undefined

getData().then((loadedEvents: EventBasic[]) => {
console.log(loadedEvents)
  events = loadedEvents
  loaded.value = LoadingState.Ok
}).catch((error: Error) => {
  console.error(error)
  loaded.value = LoadingState.Error
})

</script>

<template>
  <section v-if="loaded == LoadingState.Ok && events !== undefined">
    <div class="header">
      <h1>События</h1>
      <div class="filters">
        <input type="text" class="shadow" placeholder="Поиск"/>
        <button class="shadow"><img src="@/assets/images/icons/filter.svg" alt="Фильтр" /></button>
      </div>
    </div>
    <div class="list">
      <EventsListItem v-for="event in events" :event="event" />
    </div>
  </section>
  <section v-if="loaded == LoadingState.Error">
    <h1>Произошла ошибка 😞</h1>
  </section>
</template>

<style scoped>
@import url(@/assets/styles/events-list.css);
</style>
