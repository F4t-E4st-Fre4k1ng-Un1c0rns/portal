import asyncio
from datetime import datetime
from uuid import uuid4
from sqlalchemy import select, insert
from sqlalchemy.types import DateTime

from src.database.session import async_session_maker
from src.database.models import (
    Event,
    Document,
    Place,
    Country,
    SportType,
    TargetGroup,
    Ticket,
    TicketRegistration,
    StarterItems,
    Articles,
)


async def populate():
    session = async_session_maker()
    await session.execute(
        insert(Country).values(
            id=(country_id := uuid4()),
            name="Россия",
        )
    )
    await session.commit()
    await session.execute(
        insert(Place).values(
            id=(place_id := uuid4()),
            country_id=country_id,
            address="г. Владивосток",
        )
    )
    await session.commit()
    await session.execute(
        insert(SportType).values(
            id=(sport_type_id := uuid4()),
            name="Триатлон",
            description="Вид спорта, представляющий собой мультиспортивную гонку, состоящую из непрерывного последовательного прохождения её участниками трёх этапов: плавания, велогонки и бега",
        )
    )
    await session.commit()
    await session.execute(
        insert(TargetGroup).values(
            id=(target_group_id := uuid4()), gender="Любой", minimal_age=18
        )
    )
    await session.commit()
    await session.execute(
        insert(Event).values(
            id=(event_id := uuid4()),
            title="Триатлон «Де-Фриз 113». Соревнования по триатлону среди любителей и профессионалов на средней и стандартной дистанции.",
            about_event="Главное событие по триатлону состоится во Владивостоке, в историческом месте, на полуострове Де-Фриз.",
            registration_start=datetime(2023, 6, 1, 12),
            registration_end=datetime(2023, 6, 16),
            participation_start=datetime(2023, 7, 1, 9),
            participation_end=datetime(2023, 7, 2, 18),
            place_id=place_id,
            target_group_id=target_group_id,
            author_id=uuid4(),
            sport_type_id=sport_type_id,
        )
    )
    await session.commit()
    await session.execute(
        insert(StarterItems).values(
            id=uuid4(),
            event_id=event_id,
            starter_item="Плавательная шапочка",
        )
    )
    await session.commit()
    await session.execute(
        insert(StarterItems).values(
            id=uuid4(),
            event_id=event_id,
            starter_item="Стартовые Номера",
        )
    )
    await session.commit()
    await session.execute(
        insert(StarterItems).values(
            id=uuid4(),
            event_id=event_id,
            starter_item="Чип для Индивидуального хронометража",
        )
    )
    await session.commit()
    await session.execute(
        insert(StarterItems).values(
            id=uuid4(),
            event_id=event_id,
            starter_item="Наклейка для гардероба",
        )
    )
    await session.commit()
    await session.execute(
        insert(StarterItems).values(
            id=uuid4(),
            event_id=event_id,
            starter_item="Вложения от партнеров",
        )
    )
    await session.commit()
    await session.execute(
        insert(Articles).values(
            id=uuid4(),
            event_id=event_id,
            title="Программа",
            text="",
        )
    )
    await session.commit()
    await session.execute(
        insert(Articles).values(
            id=uuid4(),
            event_id=event_id,
            title="Дистанции",
            text="",
        )
    )
    await session.commit()
    await session.execute(
        insert(Articles).values(
            id=uuid4(),
            event_id=event_id,
            title="Этапы",
            text="",
        )
    )
    await session.commit()
    await session.execute(
        insert(Articles).values(
            id=uuid4(),
            event_id=event_id,
            title="Награждение",
            text="",
        )
    )
    await session.commit()
    await session.execute(
        insert(Articles).values(
            id=uuid4(),
            event_id=event_id,
            title="Схемы дистанции",
            text="",
        )
    )
    await session.commit()
    await session.execute(
        insert(Ticket).values(
            id=uuid4(),
            event_id=event_id,
            price=0,
            description="Зритель",
            max_places=500,
            sport_type_id=sport_type_id,
        )
    )
    await session.commit()
    await session.execute(
        insert(Ticket).values(
            id=uuid4(),
            event_id=event_id,
            price=0,
            description="Этап Кубка России по триатлону",
            max_places=10,
            sport_type_id=sport_type_id,
        )
    )
    await session.commit()
    await session.execute(
        insert(Ticket).values(
            id=uuid4(),
            event_id=event_id,
            price=0,
            description="Чемпионат Приморского края, Любители",
            max_places=10,
            sport_type_id=sport_type_id,
        )
    )
    await session.commit()
    await session.execute(
        insert(Ticket).values(
            id=uuid4(),
            event_id=event_id,
            price=0,
            description='Забег "Низководный мост".',
            max_places=10,
            sport_type_id=sport_type_id,
        )
    )
    await session.commit()


if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(populate())
    loop.close()
