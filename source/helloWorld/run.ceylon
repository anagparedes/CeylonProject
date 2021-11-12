Import ceylon.file {
    createFileIfNil,
    File,
    Nil,
    parsePath,
    Resource
}


void writeFile(String filePath) {
    Resource resource = parsePath(filePath).resource;
    // Resource has 4 subtypes: File | Directory | Link | Nil
    // We have to resolve the type.
    if (is File|Nil resource) {
        // Create the file if it doesn't exist,
        // otherwise return the resource.
        File file = createFileIfNil(resource);

        // STRATEGY 1 (overwrite)
        try (overwriter = file.Overwriter()) {
            overwriter.writeLine("something");
        }

        // STRATEGY 2 (append)
        try (appender = file.Appender()) {
            appender.writeLine("something");
        }
    }
}


shared void run() {
    print("Hello World from Ceylon!");
}
""