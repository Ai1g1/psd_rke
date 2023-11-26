#!/bin/bash

echo "Программа поиска пользователей."
echo "С помощью данной программы можно получить информацию о пользователе по его имени."
echo "Разработчики: Рыжик Кирилл и Поварнин Сергей."
needContinue=y

while [[ true ]]; do

	echo ""
	case $needContinue in
		[yY] )
				echo "Введите имя пользователя"
				read userName
				foundUserUid=$(id $userName 2>/dev/null)
				case $foundUserUid in
					uid* )
						echo ""
						echo "Пользователь – $userName."
						echo "UID – $(id -u $userName)."
						echo "Основная группа – $(id -gn $userName)."
						echo "Все группы – $(id -Gn $userName)."
						echo ""
						;;

					"такого пользователя нет" | * )
						echo ""
						echo "Пользователь $userName не найден в системе."
						echo ""
					;;
				esac
			;;

		[nN] )
			echo "Выход из программы..."
			echo ""
			exit 0
		;;

		*)
			echo "Неверная команда."
		;;
	esac

	echo "Хотите продолжить? (y/n)"
	read needContinue

done
