package com.company;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws IOException {
        FileReader fileReader = new FileReader("song.txt");
        Song s1 = new Song();
        int i = 1;

        try{
            Scanner sc = new Scanner(fileReader);
            while(sc.hasNext()){
                s1.setName(sc.nextLine());
                s1.setSinger(sc.nextLine());
                s1.setGenre(sc.nextLine());
                System.out.printf("%s\n%s\n%s\n", s1.getName(), s1.getSinger(), s1.getGenre());
                while(sc.hasNextLine()){
                    s1.setLyrics(sc.nextLine());
                    System.out.printf("%s\n", s1.getLyrics());
                    i++;
                }
            }
        }
        catch (Exception x){
            System.out.println("File was not found");
        }
        fileReader.close();

    }
}

class Song{
    private String name;
    private String singer;
    private String lyrics;
    private String genre;

    public Song() {
    }

    public Song(String name, String singer, String lyrics, String genre) {
        this.name = name;
        this.singer = singer;
        this.lyrics = lyrics;
        this.genre = genre;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    public String getLyrics() {
        return lyrics;
    }

    public void setLyrics(String lyrics) {
        this.lyrics = lyrics;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}

