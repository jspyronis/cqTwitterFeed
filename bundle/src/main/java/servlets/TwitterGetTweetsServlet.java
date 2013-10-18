package servlets;

import com.google.gson.Gson;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.jcr.api.SlingRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author John S. (jspyronis@tacitknowledge.com)
 *         Date: 17/10/2013
 *         Time: 17:12
 */

@SlingServlet(paths="/bin/twitterServlet", methods = "GET", metatype=true)
public class TwitterGetTweetsServlet extends SlingAllMethodsServlet
{

    private static final Logger LOGGER = LoggerFactory.getLogger(TwitterGetTweetsServlet.class);

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
            LOGGER.error("Error getting twitter messages...");
        }

//        Showing user timeline.");
        List<String> statusTextList = new ArrayList<String>();

        for (Status status : statusList) {
            statusTextList.add(status.getText());
        }

        Gson gson = new Gson();
        String stringGson = gson.toJson(statusTextList);


        response.getWriter().write(stringGson);
    }
}