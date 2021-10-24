package at.dhyan.jakarta.app;

import jakarta.annotation.PostConstruct;
import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import lombok.extern.slf4j.Slf4j;

@ApplicationPath("/api")
@Slf4j
public class App extends Application {

    @PostConstruct
    void postConstruct() {
        logAppInfo();
    }

    void logAppInfo() {
        log.info("+------------------------------------+");
        log.info("|        APPLICATION STARTED.        |");
        log.info("+------------------------------------+");
    }
}
