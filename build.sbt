import Dependencies._
import BuildSettings._
import sbtassembly.AssemblyPlugin.autoImport.assemblyMergeStrategy

lazy val commonDeps = Seq(logback, scalaTest, scalaCheck, akkaHttpSprayJson, embeddedPg, embeddedPgSupport, apacheCommonsIO, s3Mock)

lazy val sparkDeps =
  Seq(
    sparkCore,
    sparkSql,
    sparkStreaming,
    sparkKafka,
    postgres,
    akkaKafkaStreams
  )

lazy val authDeps = Seq(keycloakAdapter, keycloak, jbossLogging, httpClient)

lazy val akkaDeps = Seq(
  akkaSlf4J,
  akkaCluster,
  akkaTyped,
  akkaClusterTyped,
  akkaStream,
  akkaStreamTyped,
  akkaManagement,
  akkaManagementClusterBootstrap,
  akkaServiceDiscoveryDNS,
  akkaServiceDiscoveryKubernetes,
  akkaClusterHttpManagement,
  akkaClusterHttpManagement,
  akkaTestkitTyped,
  akkaStreamsTestKit,
  akkaCors,
  akkaKafkaStreams,
  embeddedKafka,
  alpakkaS3,
  akkaQuartzScheduler,
  alpakkaFile
)

lazy val akkaPersistenceDeps =
  Seq(
    akkaPersistence,
    akkaClusterSharding,
    akkaPersistenceTyped,
    akkaPersistenceQuery,
    akkaClusterShardingTyped,
    akkaPersistenceCassandra,
    cassandraLauncher
  )

lazy val akkaHttpDeps =
  Seq(akkaHttp, akkaHttp2, akkaHttpTestkit, akkaStreamsTestKit, akkaHttpCirce, akkaHttpXml)
lazy val circeDeps      = Seq(circe, circeGeneric, circeParser)
lazy val enumeratumDeps = Seq(enumeratum, enumeratumCirce)

lazy val slickDeps = Seq(slick, slickHikariCP, postgres, h2)

lazy val dockerSettings = Seq(
  Docker / maintainer := "Hmda-Ops",
  dockerBaseImage := "openjdk:17-jdk-alpine3.12",
  dockerRepository := Some("hmda")
)

lazy val packageSettings = Seq(
  // removes all jar mappings in universal and appends the fat jar
  mappings in Universal := {
    // universalMappings: Seq[(File,String)]
    val universalMappings = (mappings in Universal).value
    val fatJar            = (assembly in Compile).value
    // removing means filtering
    val filtered = universalMappings filter {
      case (_, fileName) => !fileName.endsWith(".jar") || fileName.contains("cinnamon-agent")
    }
    // add the fat jar
    filtered :+ (fatJar -> ("lib/" + fatJar.getName))
  },
  // the bash scripts classpath only needs the fat jar
  scriptClasspath := Seq((assemblyJarName in assembly).value)
)

lazy val `hmda-root` = (project in file("."))
  .settings(hmdaBuildSettings: _*)
  .aggregate(
    common,
    `hmda-platform`,
    `check-digit`,
    `institutions-api`,
    `modified-lar`,
    `hmda-analytics`,
    `hmda-data-publisher`,
    `hmda-reporting`,
    `ratespread-calculator`,
    `data-browser`,
    `hmda-spark-reporting`,
    `submission-errors`
  )

val latestGitTag = settingKey[String]("The version of Scala used for building.")
ThisBuild / latestGitTag := {
  import scala.sys.process._
  val tag: String = "git describe --tags".lineStream_!.head
  tag
}

lazy val common = (project in file("common"))
  .settings(hmdaBuildSettings: _*)
  .settings(
    PB.targets in Compile := Seq(
      scalapb.gen() -> (sourceManaged in Compile).value / "protobuf"
    ),
    Seq(
      libraryDependencies ++= commonDeps ++ authDeps ++ akkaDeps ++ akkaPersistenceDeps ++ akkaHttpDeps ++ circeDeps ++ slickDeps ++ List(
        cormorant, scalaMock, scalacheckShapeless, diffx
      )
    ),
    addCompilerPlugin("com.olegpy" %% "better-monadic-for" % "0.3.1")
  )
  .enablePlugins(BuildInfoPlugin)
  .settings(
    buildInfoKeys := Seq[BuildInfoKey](name, version, scalaVersion, sbtVersion, latestGitTag),
    buildInfoPackage := "hmda"
  )

lazy val `hmda-spark-reporting` = (project in file("hmda-spark-reporting"))
  .enablePlugins(sbtdocker.DockerPlugin, AshScriptPlugin)
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in assembly := Some("com.hmda.reports.DisclosureReports"),
      assemblyJarName in assembly := "hmda-reports.jar",
      assemblyMergeStrategy in assembly := {
        case PathList("javax", "servlet", xs @ _*)        => MergeStrategy.last
        case PathList("javax", "activation", xs @ _*)     => MergeStrategy.last
        case PathList("org", "apache", xs @ _*)           => MergeStrategy.last
        case PathList("com", "google", xs @ _*)           => MergeStrategy.last
        case PathList("com", "esotericsoftware", xs @ _*) => MergeStrategy.last
        case PathList("com", "codahale", xs @ _*)         => MergeStrategy.last
        case PathList("com", "yammer", xs @ _*)           => MergeStrategy.last
        case "META-INF/io.netty.versions.properties"      => MergeStrategy.concat
        case "META-INF/ECLIPSEF.RSA"                      => MergeStrategy.last
        case "META-INF/mailcap"                           => MergeStrategy.last
        case "META-INF/mimetypes.default"                 => MergeStrategy.last
        case "plugin.properties"                          => MergeStrategy.last
        case "log4j.properties"                           => MergeStrategy.last
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      }
    ),
    Seq(libraryDependencies ++= sparkDeps ++ circeDeps ++ akkaDeps),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")

lazy val `hmda-platform` = (project in file("hmda"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      libraryDependencies += zeroAllocationHashing,
      mainClass in Compile := Some("hmda.HmdaPlatform"),
      assemblyJarName in assembly := "hmda2.jar",
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "cinnamon-reference.conf"               => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case "logback.xml"                           => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      envVars in reStart ++= Map("CASSANDRA_CLUSTER_HOSTS" -> "localhost", "APP_PORT" -> "2551"),
      addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full)
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol` % "compile->compile;test->test")

lazy val `check-digit` = (project in file("check-digit"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.uli.HmdaUli"),
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      },
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol` % "compile->compile;test->test")

lazy val `institutions-api` = (project in file("institutions-api"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.institution.HmdaInstitutionApi"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")

lazy val `hmda-data-publisher` = (project in file("hmda-data-publisher"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      libraryDependencies ++= commonDeps ++ akkaDeps ++ akkaHttpDeps ++ circeDeps ++ slickDeps ++ enumeratumDeps :+
        scalaMock :+ cormorantGeneric :+ scalacheckShapeless :+ diffx,
      mainClass in Compile := Some("hmda.publisher.HmdaDataPublisherApp"),
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      },
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      }
    ),
    dockerSettings,
    packageSettings,
    addCompilerPlugin("com.olegpy" %% "better-monadic-for" % "0.3.1")
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol` % "compile->compile;test->test")

lazy val `hmda-dashboard` = (project in file("hmda-dashboard"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      libraryDependencies ++= commonDeps ++ akkaDeps ++ akkaHttpDeps ++ circeDeps ++ slickDeps ++
        enumeratumDeps :+ monix :+ lettuce :+ scalaJava8Compat :+ scalaMock,
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol` % "compile->compile;test->test")

lazy val `ratespread-calculator` = (project in file("ratespread-calculator"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.calculator.HmdaRateSpread"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol` % "compile->compile;test->test")

lazy val `modified-lar` = (project in file("modified-lar"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.publication.lar.ModifiedLarApp"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol`)
  .dependsOn(common)

lazy val `irs-publisher` = (project in file("irs-publisher"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.publication.lar.IrsPublisherApp"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol`)
  .dependsOn(common)

lazy val `hmda-reporting` = (project in file("hmda-reporting"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.reporting.HmdaReporting"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol`)
  .dependsOn(common)

lazy val `hmda-protocol` = (project in file("protocol"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin,
    AkkaGrpcPlugin
  )
  .settings(hmdaBuildSettings: _*)

lazy val `hmda-analytics` = (project in file("hmda-analytics"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.analytics.HmdaAnalyticsApp"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")

lazy val `rate-limit` = (project in file("rate-limit"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      libraryDependencies ++= commonDeps ++ akkaDeps ++ akkaHttpDeps :+ guava,
      mainClass in Compile := Some("hmda.rateLimit.RateLimitApp"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol`)

lazy val `data-browser` = (project in file("data-browser"))
  .enablePlugins(
    JavaServerAppPackaging,
    sbtdocker.DockerPlugin,
    AshScriptPlugin
  )
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      libraryDependencies ++= commonDeps ++ akkaDeps ++ akkaHttpDeps ++ circeDeps ++ slickDeps ++
        enumeratumDeps :+ monix :+ lettuce :+ scalaJava8Compat :+ scalaMock,
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      }
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")

lazy val `submission-errors` = (project in file("submission-errors"))
  .enablePlugins(JavaServerAppPackaging, sbtdocker.DockerPlugin, AshScriptPlugin)
  .settings(hmdaBuildSettings)
  .settings(
    libraryDependencies ++= commonDeps ++ akkaDeps ++ akkaHttpDeps ++ circeDeps ++ slickDeps :+ monix :+ slickPostgres,
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test") // allows you to depend on code from both compile and test scopes

lazy val `email-service` = (project in file("email-service"))
  .enablePlugins(JavaServerAppPackaging, sbtdocker.DockerPlugin, AshScriptPlugin)
  .settings(hmdaBuildSettings: _*)
  .settings(
    Seq(
      mainClass in Compile := Some("hmda.publication.lar.EmailReceiptApp"),
      assemblyMergeStrategy in assembly := {
        case "application.conf"                      => MergeStrategy.concat
        case "META-INF/io.netty.versions.properties" => MergeStrategy.concat
        case PathList(ps @ _*) if ps.last endsWith ".proto" =>
          MergeStrategy.first
        case "module-info.class" => MergeStrategy.concat
        case x =>
          val oldStrategy = (assemblyMergeStrategy in assembly).value
          oldStrategy(x)
      },
      assemblyJarName in assembly := {
        s"${name.value}.jar"
      },
      libraryDependencies ++= monix :: akkaKafkaStreams :: awsSesSdk :: logback :: Nil
    ),
    dockerSettings,
    packageSettings
  )
  .dependsOn(common % "compile->compile;test->test")
  .dependsOn(`hmda-protocol`)