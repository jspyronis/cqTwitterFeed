package servlets;

import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.jcr.api.SlingRepository;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.List;

/**
 * @author John S. (jspyronis@tacitknowledge.com)
 *         Date: 17/10/2013
 *         Time: 17:12
 */

@SlingServlet(paths="/bin/twitterServlet", methods = "GET", metatype=true)
public class TwitterGetTweetsServlet extends SlingAllMethodsServlet
{

    @Reference
    private SlingRepository repository;

    public void bindRepository(SlingRepository repository) {
        this.repository = repository;
    }

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServerException, IOException
    {

        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey("KbXkX3X9vAPHfIwrkASXdA")
                .setOAuthConsumerSecret("0ljYH0DigNUQ4SOCuXm6NPUAeYdN6zbxzsYHYzmq380")
                .setOAuthAccessToken("117012393-gZ4crhozO7QHEUlQkI0QMmg9iyCdnm1soS4MMRyE")
                .setOAuthAccessTokenSecret("rmdAK3DEvR6HkVTMM12CghsUTlOFBJBQ02vQQJFSIg");
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();

        List<Status> statusList = null;
        try
        {
            statusList = twitter.getUserTimeline();
        }
        catch (TwitterException e)
        {
            //logger.error("Error getting twitter messages...");
        }
        System.out.println("Showing user timeline.");
        for (Status status : statusList) {
            System.out.println(status.getUser().getName() + " : " + status.getText());
        }


        //test servlet is responding.
        response.getWriter().write("TEST_SERVET");


    }




}