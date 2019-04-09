/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.soa.midtermjersey;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lendle
 */
public class NoteRepository {
    private static List<Note> notes=new ArrayList<>();
    public static List<Note> getNotes(){
        return new ArrayList<>(notes);
    }
    
    public static Note getNote(long id){
        for(Note note : notes){
            if(note.getId()==id){
                return note;
            }
        }
        return null;
    }
    
    public static void addNote(Note note){
        if(note.getId()==-1){
            note.setId(System.currentTimeMillis());
        }
        notes.add(note);
    }
    
    public static void updateNote(Note newNote){
        Note oldNote=getNote(newNote.getId());
        if(oldNote!=null){
            oldNote.setTitle(newNote.getTitle());
            oldNote.setContent(newNote.getContent());
        }
    }
    
    public static void removeNote(long id){
        int index=-1;
        for(int i=0; i<notes.size(); i++){
            Note note=notes.get(i);
            if(note.getId()==id){
                index=i;
                break;
            }
        }
        if(index!=-1){
            notes.remove(index);
        }
    }
}
