part of default_project;

// data/gen/default/project/projects.dart

abstract class ProjectGen extends ConceptEntity<Project> {

  ProjectGen(Concept concept) {
    this.concept = concept;
  }

  ProjectGen.withId(Concept concept, String name) {
    this.concept = concept;
    setAttribute("name", name);
  }

  String get name => getAttribute("name");
  void set name(String a) { setAttribute("name", a); }

  String get description => getAttribute("description");
  void set description(String a) { setAttribute("description", a); }

  Project newEntity() => new Project(concept);
  Projects newEntities() => new Projects(concept);

  int nameCompareTo(Project other) {
    return name.compareTo(other.name);
  }

}

abstract class ProjectsGen extends Entities<Project> {

  ProjectsGen(Concept concept) {
    this.concept = concept;
  }
  
  Projects newEntities() => new Projects(concept);
  Project newEntity() => new Project(concept);

}