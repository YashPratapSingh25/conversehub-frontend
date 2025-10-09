String getHeading(String mode){
  String heading = "";
  if(mode == "interview"){
    heading = "Interview Session";
  }
  if (mode == "deleteSession") {
    heading = "Delete Session";
  }
  return heading;
}