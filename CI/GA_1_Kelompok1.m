function GA_1

close all;
clear all;
dev = true;

disp('=============================================================')
disp('Genetic algorithms: the fitness function of a single variable')
disp('=============================================================')

disp('============================================================================')
disp('Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent')  
disp('           Systems", 2nd edn. Addison Wesley, Harlow, England, 2005.        ')
disp('           Sec. 7.3 Genetic algorithms                                      ')
disp('============================================================================')

disp('=============================================================================')
disp('Problem: It is desired to find the maximum value of the function (15*x - x*x)')
disp('         where parameter "x" varies between 0 and 15. Assume that "x" takes  ')
disp('         only integer values.                                                ')
disp('=============================================================================')

disp('Hit any key to define the objective function.') 
if not(dev)
    pause
end

ObjFun='(((x.^3).*4 - (x.^2).*6 + 1).*sqrt(x+1))./(3-x)';

disp(' ')
disp('ObjFun=(((x.^3).*4 - (x.^2).*6 + 1).*sqrt(x+1))./(3-x)')
disp(' ')

disp('Hit any key to define the size of a chromosome population, the number of genes') 
disp('in a chromosome, the crossover probability, the mutation probability, possible') 
disp('minimum and maximum values of parameter "x", and the number of generations.') 
if not(dev)
    pause
end

findlowest=true	% Searching for lowest value instead
if findlowest
    ObjFun = ObjFun + "*-1";
end
nind=20;    % Size of a chromosome population
ngenes=10;  % Number of genes in a chromosome
Pc=0.7;    % Crossover probability
Pm=0.01;  % Mutation probability
xmin=-0.9;    % Possible minimum value of parameter "x"
xmax=1.2;   % Possible maximum value of parameter "x"
ngener=50; % Number of generations

disp(' ')
fprintf(1,'nind=%.0f;      Size of a chromosome population\n',nind);
fprintf(1,'ngenes=%.0f;    Number of genes in a chromosome\n',ngenes);
fprintf(1,'Pc=%.1f;      Crossover probability\n',Pc);
fprintf(1,'Pm=%.3f;    Mutation probability\n',Pm);
fprintf(1,'xmin=%.0f;      Possible minimum value of parameter "x"\n',xmin);
fprintf(1,'xmax=%.0f;     Possible maximum value of parameter "x"\n',xmax);
fprintf(1,'ngener=%.0f;   Number of generations\n',ngener);
disp(' ')

fprintf(1,'Hit any key to generate a population of %.0f chromosomes.\n',nind);
if not(dev)
    pause
end

chrom=round(rand(nind,ngenes))

disp('Hit any key to obtain decoded integers from the chromosome strings.')
if not(dev)
    pause
end

x=chrom*[2.^(ngenes-1:-1:0)]';
x=[x/((2^ngenes)-1)] % Normalisasi kromosom menjadi 0 - 1
x=[(x*(xmax-xmin))+xmin] % Normalisasi kromosom menjadi xmin - xmax

% Calculation of the chromosome fitness
ObjV=evalObjFun(ObjFun,x);
best(1)=max(ObjV);
ave(1)=mean(ObjV);

disp('Hit any key to display initial locations of the chromosomes on the objective function.')
if not(dev)
    pause
end

figure('name','Chromosome locations on the objective function');
fplot(ObjFun,[xmin,xmax])
hold;
plot(x,ObjV,'r.','markersize',15)
legend('The objective function: ' + ObjFun,'Initial chromosome population');
title('Hit any key to continue');
xlabel('Parameter "x"');
ylabel('Chromosome fitness');
hold;

disp(' ')
disp('Hit any key to run the genetic algorithm.')
if not(dev)
    pause
end

for i=1:ngener,
   
   % Fitness evaluation
   fitness=ObjV;
   if min(ObjV)<0
      fitness=fitness-min(ObjV);
   end
   
   % Roulette wheel selection
   numsel=round(nind*Pc); % The number of chromosomes to be selected for reproduction
   cumfit=repmat(cumsum(fitness),1,numsel);
   chance=repmat(rand(1,numsel),nind,1)*cumfit(nind,1);
   [selind,j]=find(chance < cumfit & chance >= [zeros(1,numsel);cumfit(1:nind-1,:)]);
   newchrom=chrom(selind,:);

   % Crossover 
   points=round(rand(floor(numsel/2),1).*(ngenes-2))+1;
   points=points.*(rand(floor(numsel/2),1)<Pc);   
   for j=1:length(points),
      if points(j),
         newchrom(2*j-1:2*j,:)=[newchrom(2*j-1:2*j,1:points(j)),...
               flipud(newchrom(2*j-1:2*j,points(j)+1:ngenes))];
      end
   end
   
   % Mutation
   mut=find(rand(numsel,ngenes)<Pm);
   newchrom(mut)=round(rand(length(mut),1));
   
   % Fitness calculation
   newx=newchrom*[2.^(ngenes-1:-1:0)]';
	newx=xmin+(newx)*(xmax-xmin)/(2^ngenes-1);
   newObjV=evalObjFun(ObjFun,newx);
  
   % Creating a new population of chromosomes
   if nind-numsel, % Preserving a part of the parent chromosome population
      [ans,Index]=sort(fitness);
      chrom=[chrom(Index(numsel+1:nind),:);newchrom];
      x=[x(Index(numsel+1:nind));newx];
      ObjV=[ObjV(Index(numsel+1:nind));newObjV];      
   else % Replacing the entire parent chromosome population with a new one
      chrom=newchrom;
      x=newx;
      ObjV=newObjV;
   end
   
   % Plotting current locations of the chromosomes on the objective function
	fplot(ObjFun,[xmin-0.5,xmax+0.1])
	hold;
	plot(x,ObjV,'r.','markersize',15)
   legend('The objective function: ' + ObjFun,'Current chromosome population');
   title(['Generation # ',num2str(i)]);
   xlabel('Parameter "x"');
   ylabel('Chromosome fitness');
   pause(0.1)
   hold; 

   best(1+i)=max(ObjV);
   ave(1+i)=mean(ObjV);
end

disp(' ')
disp('Hit any key to display the performance graph.')
if not(dev)
    pause
end

figure('name','Performance graph');
plot(0:ngener,best,0:ngener,ave);
legend('Best','Average');
title(['Pc = ',num2str(Pc),', Pm = ',num2str(Pm)]);
xlabel('Generations');
ylabel('Fitness')

function y=evalObjFun(ObjFun,x)
y=eval(ObjFun);

function newChrom=newChrom()

