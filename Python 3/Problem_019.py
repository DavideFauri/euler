# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


WEEK = {"SUN": 0, "MON": 1, "TUE": 2, "WED": 3, "THU": 4, "FRI": 5, "SAT": 6}
YEAR = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
LEAP = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


def is_leap(year):
    if year % 400 == 0:
        return True
    if year % 100 == 0:
        return False
    if year % 4 == 0:
        return True
    return False


def advance_time(today, days):
    return (today + days) % len(WEEK)


def count_day_in_20_century(day_to_count, start_year=1901, end_year=2000):
    assert 1900 <= start_year <= end_year, "Year is not 20th century"
    BEGINNING_OF_1900 = WEEK["MON"]

    day = BEGINNING_OF_1900
    for y in range(1900, start_year):
        print(y)
        year_length = 365 if is_leap(y) else 366
        day = advance_time(day, year_length)

    count = 0
    for year in range(start_year, end_year + 1):
        if is_leap(year):
            for month in LEAP:
                day = advance_time(day, month)
                count += day == WEEK[day_to_count]
        else:
            for month in YEAR:
                day = advance_time(day, month)
                count += day == WEEK[day_to_count]

    return count


if __name__ == "__main__":
    print(count_day_in_20_century("SUN"))
