<script setup lang="ts">
import { ref, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'

import { type DatabaseEvent } from '@/types/event'
import LoadingState from '@/types/loading'
import { getEventById } from '@/services/EventData'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'
import { usePopupsStore } from '@/stores/popups'

const route = useRoute()
const router = useRouter()
const popupsStore = usePopupsStore()

let loaded = ref(LoadingState.Loading)
let event: DatabaseEvent | undefined = undefined

let contentView = ref<any | undefined>()

if (typeof route.params.id === "string") {
  getEventById(route.params.id).then((loadedEvent: DatabaseEvent) => {
    popupsStore.eventName = loadedEvent.title
    event = loadedEvent
    loaded.value = LoadingState.Ok
  }).catch((error: Error) => {
    console.error(error)
    loaded.value = LoadingState.Error
  })
} else {
  loaded.value = LoadingState.Error
}

const scrollToRegistration = () => {
  router.push({ name: 'event-overview' })
  contentView.value?.$el.scrollIntoView({ behavior: 'smooth' })
}

onUnmounted(() => {
  popupsStore.eventName = ""
})
</script>
<template>
  <div v-if="loaded == LoadingState.Ok && event !== undefined">
    <section class="big-banner" :style="`--background-image: url(${event.banner})`">
      <div class="group">
        <h1>{{ event.title }}</h1>
        <div class="info">
          <time class="icon" :datetime="event.participation_start.toISOString()">
            {{ dateStartAndEndToHumanReadableConverter(event.participation_start, event.participation_end) }}
          </time>
          <span class="location icon">{{ event.place.address }}</span>
        </div>
        <button class="button" @click="scrollToRegistration">Регистрация</button>
      </div>
    </section>
    <section>
      <nav>
        <router-link
          :to="{ name: 'event-overview' }"
          :class="{ active: $route.name == 'event-overview' }"
          class="link"
          >Обзор</router-link>
        <router-link
          :to="{ name: 'event-participants' }"
          :class="{ active: $route.name == 'event-participants' }"
          class="link"
          >Участники</router-link>
        <button class="share image-icon">
          <img src="@/assets/images/icons/share.svg" alt="Поделиться" />
        </button>
      </nav>
    </section>
    <router-view :event="event" ref="contentView" />
  </div>

  <section v-else-if="loaded == LoadingState.Loading">
    <p>Пожалуйста, подождите</p>
  </section>
  <section v-else-if="loaded == LoadingState.Error">
    <p>Произошла ошибка((</p>
  </section>
</template>

<style scoped>
@import '@/assets/styles/event.css';
</style>
