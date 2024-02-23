function dateToHumanReadableConverter(d: Date) {
  return d.toLocaleDateString('ru', { day: 'numeric', month: 'short', year: 'numeric' })
}

function dateStartAndEndToHumanReadableConverter(start: Date, end: Date) {
  console.log(start, end)
  console.log(start.getDate(), end.getDate())
  if (start.getDay() === end.getDay() && start.getMonth() === end.getMonth()) {
    return dateToHumanReadableConverter(start)
  } else {
    return `${dateToHumanReadableConverter(start)} - ${dateToHumanReadableConverter(end)}`
  }
}

export { dateStartAndEndToHumanReadableConverter }
