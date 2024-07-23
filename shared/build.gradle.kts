plugins {
    alias(libs.plugins.kotlinMultiplatform)
    alias(libs.plugins.androidLibrary)
}

kotlin {
    androidTarget {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    
    listOf(
        iosX64(),
        iosArm64(),
        iosSimulatorArm64()
    ).forEach {
        it.binaries.framework {
            baseName = "shared"
            isStatic = true
            linkerOpts.add("-F ${rootProject.projectDir}/iosApp")
        }
    }

    sourceSets {
        commonMain.dependencies {
            //put your multiplatform dependencies here
        }
        commonTest.dependencies {
            implementation(libs.kotlin.test)
        }
    }
}

android {
    namespace = "com.esri.feeds"
    compileSdk = 34
    defaultConfig {
        minSdk = 28
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
}

tasks.register("resolveSwiftPackages", Exec::class) {
    description = "Resolve Swift packages"
    group = "build"

    workingDir = file("iosApp")
    commandLine("swift", "package", "resolve")

    // Only run the task if the directory exists
    onlyIf {
        workingDir.exists()
    }
}

tasks.matching { it.name.contains("iosArm64") || it.name.contains("iosX64") }.configureEach {
    dependsOn("resolveSwiftPackages")
}