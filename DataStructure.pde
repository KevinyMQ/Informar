class Estado{

  String name;
  ArrayList<Porto> porto = new ArrayList<Porto>();


  Estado(String name){
  this.name = name;
  }
  
}

class Porto{

 String name;
 ArrayList<Ano> ano = new ArrayList<Ano>();
 
 Porto(String name){
 this.name = name;
 }
}

class Ano{
 int ano;
 Mes[] mes = new Mes[12];
 
 Ano(int ano){
   this.ano = ano;
   for(int i = 0; i < mes.length; i++){
     mes[i] = new Mes(i+1);
   }
   if(ano % 4 == 0){
     mes[1].dias = 29;
     mes[1].dia.add(new Dia(29));
   }
 }
 
 
}

class Mes{
  String name;
  int dias;
  ArrayList<Dia> dia = new ArrayList<Dia>();
  
  Mes(int n){
    if(n == 1){
      name = "Janeiro";
      dias = 31;
    }else if(n == 2){
      name = "Fevereiro";
      dias = 28;
    }else if(n == 3){
      name = "Março";
      dias = 31;
    }else if(n == 4){
      name = "Abril";
      dias = 30;
    }else if(n == 5){
      name = "Maio";
      dias = 31;
    }else if(n == 6){
      name = "Junho";
      dias = 30;
    }else if(n == 7){
      name = "Julho";
      dias = 31;
    }else if(n == 8){
      name = "Agosto";
      dias = 31;
    }else if(n == 9){
      name = "Setembro";
      dias = 30;
    }else if(n == 10){
      name = "Outubro";
      dias = 31;
    }else if(n == 11){
      name = "Novembro";
      dias = 30;
    }else if(n == 12){
      name = "Dezembro";
      dias = 31;
    }else{
      name = "Desconhecido";
      dias = 99;
    }
    
    for(int i = 0; i < dias; i++){
      dia.add(new Dia(i+1));
    }
    
  }

  Mes(String name, int dias){
    this.name = name;
    for(int i = 0; i < dias; i++){
      dia.add(new Dia(i+1));
    }
  }
  
  int[] getDays(){
      int[] days = new int[dia.size()];
    for(int i = 0; i < dia.size(); i++){
      days[i] = dia.get(i).dia;
    }
    return days;
  }

}

class Dia{
  int dia;
  Hora[] hora = new Hora[4];
  
  Dia(int dia){
    this.dia = dia;
  }
  
}

class Hora{
  String hora;
  int mare;
  
  Hora(String hora){
    this.hora = hora;
  }
  
}

//Functions
String[] convertArrayIntToString(int[] original){
  String[] converted = new String[original.length];
  for(int i = 0; i < original.length; i++){
    converted[i] = Integer.toString(original[i]);
  }
  return converted;
}
String[] getMonthNames(){
  String[] mesString = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
  return mesString;   
}
String[] getMonthShortNames(){
  String[] mesShortString = {"JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"};
  return mesShortString;   
}
int[] getOnlyYearArray(Ano[] ano){
  int[] anoNumber = new int[ano.length];
  for(int i = 0; i < anoNumber.length; i++){
    anoNumber[i] = ano[i].ano;
  }
  return anoNumber;
}
String[] toUpperCaseArray(String[] str){
  String[] upr = new String[str.length];
  for(int i = 0; i < str.length; i++){
    upr[i] = str[i].toUpperCase();
  }
  return upr;   
}
