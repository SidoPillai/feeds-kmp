enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")
pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://esri.jfrog.io/artifactory/arcgis") }
    }
}

rootProject.name = "Feeds"
include(":androidApp")
include(":shared")