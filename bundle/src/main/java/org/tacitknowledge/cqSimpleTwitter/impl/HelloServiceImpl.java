package org.tacitknowledge.cqSimpleTwitter.impl;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.jcr.api.SlingRepository;
import org.tacitknowledge.cqSimpleTwitter.HelloService;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;
import twitter4j.internal.logging.Logger;

import javax.jcr.Repository;

/**
 * One implementation of the {@link HelloService}. Note that
 * the repository is injected, not retrieved.
 */
@Service
@Component(metatype = false)
public class HelloServiceImpl implements HelloService {
    
    @Reference
    private SlingRepository repository;


    private static Logger logger = Logger.getLogger(HelloServiceImpl.class);


    public String getRepositoryName() {
        return repository.getDescriptor(Repository.REP_NAME_DESC);
    }


    public static void main(String args[]){
       testTwitterGetNames();
    }

    public static void testTwitterGetNames()

    {
        // The factory instance is re-useable and thread safe.
        //Twitter twitter = TwitterFactory.getSingleton();


        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey("KbXkX3X9vAPHfIwrkASXdA")
                .setOAuthConsumerSecret("0ljYH0DigNUQ4SOCuXm6NPUAeYdN6zbxzsYHYzmq380")
                .setOAuthAccessToken("117012393-gZ4crhozO7QHEUlQkI0QMmg9iyCdnm1soS4MMRyE")
                .setOAuthAccessTokenSecret("rmdAK3DEvR6HkVTMM12CghsUTlOFBJBQ02vQQJFSIg");
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();

        Query query = new Query("source:twitter4j jspyronis");
        QueryResult result = null;
        try
        {
            result = twitter.search(query);
        }
        catch (TwitterException e)
        {
            logger.error("Error with twitter exception...");
        }
        for (Status status : result.getTweets()) {
            System.out.println("@" + status.getUser().getScreenName() + ":" + status.getText());
        }

        System.out.println(result.getTweets().size());

    }


}
