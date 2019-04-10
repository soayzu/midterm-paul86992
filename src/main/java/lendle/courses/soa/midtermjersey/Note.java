/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.soa.midtermjersey;

/**
 *
 * @author lendle
 */
public class Note {
    private long id=-1;
    private String title=null;
    private String content=null;

    public Note(long id, String title, String content) {
        this.id=id;
        this.title=title;
        this.content=content;
    }

    public Note() {
    }
    
    
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
