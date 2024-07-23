package com.esri.feeds

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform