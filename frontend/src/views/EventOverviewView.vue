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
  <div v-if="loaded && event !== undefined">
    <section>
      <h2>Старты</h2>
      <div class="starts-list" v-if="tickets !== undefined">
        <div
          v-for="ticket in tickets" class="starts-item shadow" :key="ticket.id">
          <p class="name">{{ ticket.description }}</p>
          <p class="distance">{{ ticket.price }}<br>₽</p>
          <p class="people icon">{{ ticket.max_places }}</p>
          <a href="" class="button disabled">Результаты</a>
        </div>
      </div>
    </section>
    <section class="about">
      <header>
        <h2>О событии</h2>
        <a href="https://vk.com/memy_pro_kotow">
          <img src="@/assets/images/icons/vk.svg" alt="Ссылка на VK" />
        </a>
      </header>
      <div class="description">
        <article v-html="event.about_event"></article>
        <div aria-hidden="true" class="slider">
          <button class="prev image-icon">
            <img src="@/assets/images/icons/prev.svg" />
          </button>
          <img src="@/assets/images/tempory-assets/marathon.jpg" />
          <button class="next image-icon">
            <img src="@/assets/images/icons/next.svg" />
          </button>
        </div>
      </div>
      <div class="details-list">
        <details v-for="article in event.articles" class="shadow">
          <summary>{{ article.title }}</summary>
          <div v-html="article.text" class="inner-text"></div>
        </details>
      </div>
    </section>
  </div>
</template>

<style scoped>
@import '@/assets/styles/event-overview.css';
</style>
