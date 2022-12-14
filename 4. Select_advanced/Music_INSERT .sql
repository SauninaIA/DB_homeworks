INSERT INTO singers (name)
VALUES ('Stranger'),
       ('Terry Adams'),
       ('Camilla Chase'),
       ('Judge'),
       ('Billie Bolt'),
       ('Anita Child'),
       ('Blue'),
       ('Quilly');
       
INSERT INTO genres (name)
VALUES ('rock'),
       ('hip-hop'),
       ('jazz'),
       ('pop'),
       ('electro');
      
INSERT INTO albums (name, year_release)
VALUES ('Sweetbitter', '2008'),
       ('No choice', '2010'),
       ('Cookie cutter', '2020'),
       ('Audience', '2018'),
       ('Drop dead', '2005'),
       ('Glass house', '2021'),
       ('With feeling', '2005'),
       ('Pushing buttons', '2002');
      
INSERT INTO tracks (name, duration, id_album)
VALUES ('A Song Of A Promise', '295', '7'),
       ('I Am The One', '231', '4'),
       ('Fear', '250', '1'),
       ('Money For His Pain', '201', '8'),
       ('Whats Up?', '296', '6'),
       ('Speed', '247', '7'),
       ('Young And Chance', '184', '6'),
       ('Wind For My Love', '165', '5'),
       ('Man Of Heaven', '300', '3'),
       ('Things Of My Party', '178', '8'),
       ('Dance Of Nowhere', '297', '5'),
       ('I Love I Am Trouble', '252', '2'),
       ('Finding My Own', '249', '5'),
       ('Lightning And Smile', '151', '4'),
       ('Jungle', '285', '8'),
       ('Machines For Life', '275', '1'),
       ('Nightlife And Love', '290', '2'),
       ('Storm And Woman', '151', '7');
      

INSERT INTO collections (name, year_release)
VALUES ('Best dance', '2010'),
       ('Top hits', '2020'),
       ('Romantic collection', '2021'),
       ('Party', '2019'),
       ('Single', '2016'),
       ('Wedding hits', '2014'),
       ('Summer hits', '2021'),
       ('Teens choice', '2022'); 
      
INSERT INTO genre_singer (id_genre, id_singer)
VALUES ('4', '3'),
       ('1', '3'),
       ('1', '1'),
       ('5', '1'),
       ('4', '2'),
       ('2', '4'),
       ('3', '5'),
       ('4', '6'),
       ('2', '6'),
       ('1', '6'),
       ('1', '7'),
       ('4', '7'),
       ('1', '8'),
       ('2', '8'),
       ('4', '8'),
       ('5', '8');
       
INSERT INTO album_singer (id_album, id_singer)
VALUES ('1', '1'),
       ('6', '2'),
       ('7', '2'),
       ('3', '3'),       
       ('4', '4'),
       ('8', '4'),
       ('3', '5'),
       ('5', '7'),
       ('2', '6'),
       ('7', '6'),
       ('2', '8'),
       ('1', '8');
                  
INSERT INTO collection_track (id_collection, id_track)
VALUES ('1', '2'),
       ('1', '5'),
       ('1', '10'),
       ('1', '15'),
       ('2', '1'),
       ('2', '2'),
       ('2', '3'),
       ('2', '4'),
       ('2', '5'),
       ('2', '7'),
       ('2', '14'),
       ('3', '1'),
       ('3', '2'),
       ('3', '8'),
       ('3', '9'),
       ('3', '12'),
       ('4', '6'),
       ('4', '7'),
       ('4', '10'),
       ('4', '11'),
       ('4', '15'),
       ('5', '1'),
       ('5', '2'),
       ('5', '3'),
       ('5', '4'),
       ('6', '1'),
       ('6', '2'),
       ('6', '7'),
       ('6', '8'),
       ('6', '9'),
       ('6', '13'),
       ('7', '15'),
       ('7', '14'),
       ('7', '11'),
       ('8', '4'),
       ('8', '3'),
       ('8', '5'),
       ('8', '6'),
       ('8', '7'),
       ('8', '10'),
       ('8', '12'),
       ('8', '15');