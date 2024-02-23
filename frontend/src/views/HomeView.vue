<script setup lang="ts">
import { ref } from 'vue'
import { type EventBasic } from '@/types/event'
import Champions from '@/components/home/Champions.vue'
import { getData } from '@/services/HomeData'
// Champions data mocking
const events: EventBasic[] = getData()

import honorIceRun from '@/assets/images/tempory-assets/honor-ice-run.png'
import hockey from '@/assets/images/tempory-assets/hockey.jpg'

const sliderImages = [
  honorIceRun,
  hockey
]
let currentSliderImage = ref(0)
function changeSlider(delta: number) {
  currentSliderImage.value = (currentSliderImage.value + delta) % sliderImages.length
  if (currentSliderImage.value < 0) {
    currentSliderImage.value = sliderImages.length - 1
  }
}
</script>

<template>
  <main>
    <section class="big-banner header-banner">
      <div class="group">
        <h1>Всегда на шаг впереди</h1>
      </div>
    </section>
    <section>
      <h2>Чемпионы прошедших событий</h2>
      <div class="champion-list">
        <Champions v-for="event in events" :event="event" :key="event.id" />
      </div>
    </section>
    <section>
      <header>
        <h2>Ближайшие ожидаемые события</h2>
        <router-link :to="{ name: 'events-list' }" class="more-info shadow">
          Афиша
        </router-link>
      </header>
      <div class="slider nearest-event-slider">
        <button class="prev image-icon" @click="changeSlider(-1)">
          <img src="@/assets/images/icons/prev.svg" alt="Предыдушее событие" />
        </button>
        <div
          class="shadow active"
          :style="`background-image: url(${sliderImages[currentSliderImage]})`"
        >
          <div>
            <h3>Magic Vladivostok Ice Run 24</h3>
            <time datetime="" class="icon light-bg">17 февраля</time>
          </div>
          <span class="icon location light-bg">г. Владивосток</span>
        </div>
        <button class="next image-icon" @click="changeSlider(1)">
          <img src="@/assets/images/icons/next.svg" alt="Следующее событие" />
        </button>
      </div>
    </section>

    <section>
      <h2>С места события</h2>
      <div class="photos-grid shadow">
        <img src="@/assets/images/home-grid/1-1.jpg" />
        <img src="@/assets/images/home-grid/1-2.jpg" />
        <img src="@/assets/images/home-grid/2-1.jpg" />
        <img src="@/assets/images/home-grid/2-2.jpg" />
        <img src="@/assets/images/home-grid/3-1.jpg" />
        <img src="@/assets/images/home-grid/3-2.jpg" />
        <img src="@/assets/images/home-grid/4-1.jpg" />
        <img src="@/assets/images/home-grid/4-2.jpg" />
      </div>
    </section>

    <section class="creators">
      <h2 class="creators-title">Организация мероприятий</h2>
      <section class="opportunity" id="create">
        <div>
          <h3>Создавайте</h3>
          <p>идеальное событие шаг за шагом</p>
        </div>
      </section>
      <section class="opportunity" id="setup">
        <div>
          <h3>Настраивайте</h3>
          <p>персональные сервисы для участников</p>
        </div>
      </section>
      <section class="opportunity" id="advert">
        <div>
          <h3>Продвигайте</h3>
          <p>мероприятие, используя маркетинговые сервисы платформы и партнёрскую программу</p>
        </div>
      </section>
      <section class="opportunity" id="analyze">
        <div>
          <h3>Анализируйте</h3>
          <p>полученную статистику по участиям в событии</p>
        </div>
      </section>

      <a href="" class="button create shadow">Создать мероприятие</a>
    </section>
  </main>
</template>

<style scoped>
@import '@/assets/styles/home.css';
</style>
