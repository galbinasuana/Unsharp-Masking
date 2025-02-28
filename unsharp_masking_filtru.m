% incarcare imagine
imagine_originala = imread('rice.png');
% imagine_originala = imread('vulcano.png');
% imagine_originala = imread('lightning.png');

% obtinere dimensiune imagine
[m, n, p] = size(imagine_originala);

% incarcare masca + normalizare
w = load('masca.txt');
w = w / sum(w(:));

% definire m1 și n1
m1 = size(w, 1);
n1 = size(w, 2);

% matrice pentru imaginea nivelata
imagine_nivelata = zeros(m, n, p);

% aplicare filtrul medie pentru fiecare canal
for i = 1:p
    imagine_nivelata(:,:,i) = filtru(double(imagine_originala(:,:,i)), m, n, w, m1, n1);
end

imagine_nivelata = uint8(imagine_nivelata);

% unsharp masking formula: imagine originala + (imagine originala - imaginea nivelata)
unsharp_masking = double(imagine_originala) + (double(imagine_originala) - double(imagine_nivelata));
unsharp_masking = uint8(unsharp_masking);

% setarea unui factor de amplificare
factor_amplificare = 1.5;
unsharp_masking_amplificat = double(imagine_originala) + factor_amplificare * (double(imagine_originala) - double(imagine_nivelata));
unsharp_masking_amplificat = uint8(unsharp_masking_amplificat);

% afisare rezultate
figure
subplot(2, 2, 1);
imshow(imagine_originala);
title('Imaginea initiala');
subplot(2, 2, 2);
imshow(imagine_nivelata);
title('Imaginea nivelata cu filtru medie');
subplot(2, 2, 3);
imshow(unsharp_masking);
title('Imaginea cu unsharp masking');
subplot(2, 2, 4);
imshow(unsharp_masking_amplificat);
title('Imaginea cu unsharp masking amplificat');

