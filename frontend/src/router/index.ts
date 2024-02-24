import { createRouter, createWebHistory, type RouteLocationNormalized } from 'vue-router'
import 'vue-router'

declare module 'vue-router' {
  interface RouteMeta {
    title?: string
  }
}

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomeView.vue'),
      meta: { title: 'Главная страница' }
    },
    {
      path: '/event/',
      name: 'events-list',
      component: () => import('@/views/EventsListView.vue'),
      meta: { title: 'Список событий' }
    },
    {
      path: '/event/:id',
      name: 'event',
      children: [
        {
            path: '', 
            name: 'event-overview',
            component: () => import('@/views/EventOverviewView.vue')
        },
        {
          path: 'participants',
          name: 'event-participants',
          component: () => import('@/views/EventParticipantsView.vue'),
          children: [
            {
              path: ':ticket_id',
              name: 'event-participants-list',
              component: () => import('@/views/EventParticipantsListView.vue'),
              meta: { title: 'Список участников' }
            }
          ]
        }
      ],
      component: () => import('@/views/EventView.vue')
    }
  ],
})

export default router
