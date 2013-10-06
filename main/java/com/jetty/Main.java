package com.jetty;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.*;
import org.eclipse.jetty.webapp.WebAppContext;

/**
 * 
 * This class launches the web application in an embedded Jetty container.
 * This is the entry point to your application. The Java command that is used for
 * launching should fire this main method.
 *
 */
public class Main {
    
	private static Server server;;
    public static void main(String[] args) throws Exception{
        String webappDirLocation = "src/main/webapp/";
        
        //The port that we should run on can be set into an environment variable
        String webPort = System.getenv("PORT");
        if(webPort == null || webPort.isEmpty()) {
            webPort = "80";
        }

        server = new Server(Integer.valueOf(webPort));
        WebAppContext root = new WebAppContext();

        root.setContextPath("/");
        root.setDescriptor(webappDirLocation+"/WEB-INF/web.xml");
        root.setResourceBase(webappDirLocation);
        
        // --- setup a monitor for github. 
        Thread githubMonitor = new MonitorThread();
        githubMonitor.start();
        
        //Parent loader priority is a class loader setting that Jetty accepts.
        //By default Jetty will behave like most web containers in that it will
        //allow your application to replace non-server libraries that are part of the
        //container. Setting parent loader priority to true changes this behavior.
        //Read more here: http://wiki.eclipse.org/Jetty/Reference/Jetty_Classloading
        root.setParentLoaderPriority(true);
        server.setHandler(root);
        server.start();
        server.join();  
    }
    
    // here's a static class to listen to port 8079 that will stop, and pull the new git code.
    private static class MonitorThread extends Thread {
    	
    	        private ServerSocket socket;
    	        public MonitorThread() {
    	            setDaemon(true);
    	            setName("GithubMonitor");
    	            try {
    	                socket = new ServerSocket(8079, 1, InetAddress.getLocalHost());
    	            } catch(Exception e) {
    	                throw new RuntimeException(e);
    	            }
    	        }
    	 
    	        @Override
    	        public void run() {
    	            System.out.println("*** running jetty 'stop' thread");
    	            Socket accept;
    	            try {
    	                accept = socket.accept();
    	                System.out.println("*** stopping jetty embedded server");
    	                server.stop();
                        Runtime.getRuntime().exec(new String[] { "/bin/bash", "-c","/home/ec2-user/start.sh"}).waitFor();
    	                accept.close();
    	                socket.close();
    	            } catch(Exception e) {
    	                throw new RuntimeException(e);
    	            }
    	        }
    	    }


}
