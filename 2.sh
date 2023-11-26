#!/bin/bash

function SetErrorCode
{
	exitCode=1
}

function SetSuccessCode
{
	exitCode=0
}

function OutputUserInfo
{
	echo ""
	echo "Пользователь – $userName."
	echo "UID – $(id -u $userName)."
	echo "Основная группа – $(id -gn $userName)."
	echo "Все группы – $(id -Gn $userName)."
	echo ""
	SetSuccessCode
}

function OutputUserNotExistsError
{
	echo ""
	echo "Пользователь $userName не найден в системе." 1>&2
	echo ""
	SetErrorCode
}

function HandleUserInput
{
	echo "Введите имя пользователя"
	read userName
	foundUser=$(id $userName 2>/dev/null)
	case $foundUser in
		uid* )
			OutputUserInfo
			;;

		"такого пользователя нет" | * )
			OutputUserNotExistsError
		;;
	esac
}

function Exit
{
	echo "Выход из программы..."
	echo ""
	exit $exitCode
}

function OutputCommandNotExistsError
{
	echo "Неверная команда." 1>&2
	echo ""
	SetErrorCode
}

echo "Программа поиска пользователей."
echo "С помощью данной программы можно получить информацию о пользователе по его имени."
echo "Разработчики: Рыжик Кирилл и Поварнин Сергей."
isNeedContinue=y
while [[ true ]]; do
	echo ""
	case $isNeedContinue in
		[yY] )
			HandleUserInput
		;;
		[nN] )
			Exit
		;;
		*)
			OutputCommandNotExistsError
		;;
	esac

	echo "Хотите продолжить? (y/n)"
	read isNeedContinue

done
