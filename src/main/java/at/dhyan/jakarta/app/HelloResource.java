package at.dhyan.jakarta.app;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/hello")
@Produces(MediaType.APPLICATION_JSON)
public class HelloResource {

    @GET
    public Response getPlainVersion() {
        return Response
                .status(Response.Status.OK)
                .entity("{\"Hello\":\"World\"}")
                .build();
    }
}
