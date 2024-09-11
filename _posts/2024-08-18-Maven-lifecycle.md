---
layout: post
title: Maven Lifecycle
categories: 
    - TodayILearned
---

# Maven Lifecycle

### Categories:
- todayILearned

---

## Overview

Maven operates with three primary built-in lifecycles:

1. **Default Lifecycle**: The main lifecycle responsible for project deployment. It consists of a series of phases executed in order.
2. **Clean Lifecycle**: Manages project cleaning, such as removing files generated in previous builds.
3. **Site Lifecycle**: Generates project documentation.

---

## Default Lifecycle Phases

The default lifecycle consists of several phases, each performing a specific task:

- **validate**: Validates the project structure and configuration.
- **compile**: Compiles the source code of the project.
- **test**: Runs unit tests using a suitable testing framework.
- **package**: Packages the compiled code into a distributable format (e.g., JAR, WAR).
- **verify**: Runs checks on the results of integration tests to ensure quality criteria are met.
- **install**: Installs the package into the local repository for use as a dependency in other projects.
- **deploy**: Deploys the package to a remote repository for sharing with other developers and projects.

---

## Site Lifecycle Phases

The site lifecycle is responsible for creating project documentation. To generate the site, run the following command:

```bash
mvn site
```

Executing Maven Phases
You can execute a specific phase by running the following command:
```
mvn <phase>
```
## Goal Binding

Each phase in a lifecycle is bound to one or more plugin goals. For example, in the `compile` phase, the `maven-compiler-plugin:compile` goal is executed.

### Example: Integrating `maven-checkstyle-plugin`

```xml
<project>
    ...
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-checkstyle-plugin</artifactId>
                <version>3.2.2</version> <!-- Use the latest version available -->
                <executions>
                    <execution>
                        <phase>validate</phase>
                        <goals>
                            <goal>check</goal>
                        </goals>
                    </execution>
                </executions>
                <configuration>
                    <configLocation>checkstyle.xml</configLocation>
                    <encoding>UTF-8</encoding>
                    <consoleOutput>true</consoleOutput>
                    <failsOnError>true</failsOnError>
                </configuration>
            </plugin>
        </plugins>
    </build>
    ...
</project>
```

### Creating a Checkstyle Configuration File

You need to create a `checkstyle.xml` configuration file:

```xml
<?xml version="1.0"?>
<!DOCTYPE module PUBLIC
    "-//Checkstyle//DTD Checkstyle Configuration 1.3//EN"
    "https://checkstyle.org/dtds/configuration_1_3.dtd">

<module name="Checker">
    <module name="TreeWalker">
        <module name="JavadocMethod"/>
        <module name="MagicNumber"/>
        <module name="IllegalImport"/>
        <module name="LineLength">
            <property name="max" value="120"/>
        </module>
        <module name="WhitespaceAround"/>
    </module>
</module>
```

The complete list of configurations can be found here: https://checkstyle.org/index.html

This file can be placed in your project's root directory or in the src/main/resources directory.

To run the checkstyle plugin, use:
```mvn checkstyle:check```
or it will run during:
```mvn validate```
