package models;

public class LikeCalc {

    public void likeAdd(Post p) {
        int count = p.getLikeCount();
        count++;
        p.setLikeCount(count);
    }

    public void likeRed(Post p) {
        int count = p.getLikeCount();
        count--;
        p.setLikeCount(count);
    }

}
