package com.ttgsolutions.jerseysample.controllers;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

/**
 * Test resource, which represents “Hello world!”.
 */
@Path("/test")
public class Test {

    @GET
    @Produces("text/plain")
    public Response getText() {
        return Response.ok("Hello world!\n").build();
    }
}
