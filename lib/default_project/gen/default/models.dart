part of default_project;

// data/gen/default/models.dart

class DefaultModels extends DomainModels {

  DefaultModels(Domain domain) : super(domain) {
    add(fromJsonToProjectEntries());
  }

  ProjectEntries fromJsonToProjectEntries() {
    return new ProjectEntries(fromJsonToModel(
      defaultProjectModelJson,
      domain,
      DefaultRepo.defaultProjectModelCode));
  }

}


