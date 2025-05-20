package util

import (
	"math/rand"
)

// function to generate a random integer between min and max
func RandomInt(min, max int) int {
	return min + int(rand.Int63n(int64(max-min+1)))
}

// function to generate a random string of given length
func RandomString(n int) string {
	const letterBytes = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	b := make([]byte, n)
	for i := range b {
		b[i] = letterBytes[rand.Intn(len(letterBytes))]
	}
	return string(b)
}

// function to generate a random owner name
func RandomOwner() string {
	return RandomString(6)
}

// function to generate a random money amount
func RandomMoney() int64 {
	return int64(RandomInt(0, 1000))
}

// function to generate a random currency
func RandomCurrency() string {
	currencies := []string{"USD", "EUR", "CAD"}
	n := len(currencies)
	return currencies[rand.Intn(n)]
}
