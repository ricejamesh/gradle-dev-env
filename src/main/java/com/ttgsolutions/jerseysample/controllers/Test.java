package com.ttgsolutions.jerseysample.controllers;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * Test resource, which represents “Hello world!”.
 */
@Path("/test")
public class Test {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public Response getTest() {
        return Response.ok("Hello world!\n").build();
    }

//    @GET @Path("{id}")
//    @Produces(MediaType.APPLICATION_JSON)
//    public Response getManyTest(@PathParam("id") String id) {
//        return Response.ok("Hello world!\n").build();
//    }
}
