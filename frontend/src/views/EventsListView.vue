<script setup lang="ts">
import { ref, watch } from 'vue'

import LoadingState from '@/types/loading'
import { type EventBasic } from '@/types/event'
import { getData } from '@/services/EventsListData'
import EventsListItem from '@/components/eventList/EventsListItem.vue'

let loaded = ref(LoadingState.Loading)
let events: EventBasic[] | undefined = undefined
let search = ref('')

const updateEvents = () => {
  loaded. value = LoadingState.Loading
  getData(search.value).then((loadedEvents: EventBasic[]) => {
    events = loadedEvents
    loaded.value = LoadingState.Ok
  }).catch((error: Error) => {
    console.error(error)
    loaded.value = LoadingState.Error
  })
}
updateEvents()

watch(search, updateEvents)

</script>

<template>
  <section>
    <div class="header">
      <h1>События</h1>
      <div class="filters">
        <input type="text" class="shadow" placeholder="Поиск" v-model="search"/>
        <button class="shadow"><img src="@/assets/images/icons/filter.svg" alt="Фильтр" /></button>
      </div>
    </div>
    <div class="list"  v-if="loaded == LoadingState.Ok && events !== undefined">
      <EventsListItem v-for="event in events" :event="event" />
    </div>
    <div v-if="events !== undefined && events.length < 1">
      <p>По вашему запросу ничего не найдено</p>
    </div>
    <p v-if="loaded == LoadingState.Loading">Пожалуйста, подождите...</p>
    <p v-if="loaded == LoadingState.Error">Произошла ошибка 😞</p>
  </section>
</template>

<style scoped>
@import url(@/assets/styles/events-list.css);
</style>
