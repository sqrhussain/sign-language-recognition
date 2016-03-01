
createDataBase('hands/temp/', 'data3');

[hands,regions] = readHands2('hands' , 5 , 'jpg');

[hands,regions] = readHands('hands' , 5 , 'jpg');

[hands] = readHands3('data3' , 5 , 'jpg');

figure,imshow( reshape(hands , 500 , 100)  );


grayImage = rgb2gray(imread( 'hands/hand (1).jpg' ));
[a bounds]= HandDetector(grayImage);


[hands] = readHands3('hands\new' , 5 , 'png');
imshow( reshape(hands(1,:) , 100 , 100) )
predict( Theta1 , Theta2 , hands )


