package servlets;

import twitter4j.Status;

import java.util.Comparator;

/**
 * @author John S. (jspyronis@tacitknowledge.com)
 *         Date: 29/10/2013
 *         Time: 14:30
 */
public class TwitterDatesComparator implements Comparator<Status>
{

    @Override
    public int compare(Status o1, Status o2)
    {
        return o1.getCreatedAt().compareTo(o2.getCreatedAt());
    }
}
