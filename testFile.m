clear all;
clc;


obj = readObj("315.obj");
vertices = obj.v;
% shp = alphaShape(vertices(:,1),vertices(:,3),vertices(:,2));
% plot(shp)
%mesh(obj.f.v)
% displayobjnotexture(obj)

%% Może się przydać
p = obj.v ;
t = obj.f.v ; 
N = 1 ;

figure()
tris = trisurf(t,p(:,1),p(:,2),p(:,3),0)
% [c,h]=tricontour(t,p(:,1),p(:,2),p(:,3),N) ;
%axis square;
%axis equal;
%view([90, 45]);
direction = [1 0 0];
rotate(tris,direction,90)




function displayobjnotexture (obj)
    figure()
    facevertex = [];
    for i = 1:size(obj.v)
        facevertex(i) = 0;
    end
    facevertex = facevertex';
    patch('vertices', obj.v, 'faces', obj.f.v,'FaceVertexCData', facevertex);
    shading interp
    axis square;
    axis equal;
    view([-37.5, -30]);
    %endfunction
end