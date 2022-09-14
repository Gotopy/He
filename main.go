package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	r := gin.Default()
	r.GET("/", func(context *gin.Context) {
		context.String(http.StatusOK, "hello gin")
	})
	r.GET("/healthy", func(context *gin.Context) {
		context.String(http.StatusOK, "it is very healthy service")
	})
	r.Run()
}
