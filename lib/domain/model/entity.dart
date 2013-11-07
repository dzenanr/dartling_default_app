part of dartling_default_app;

class EntityTable {

  View view;

  bool hidden = true;

  EntityTable(this.view);

  bool get shown => !hidden;

  void show() {
    if (hidden) {
      String section = '<br/> \n';
      section = '${section}<table> \n';
      section = '${section}  <caption> \n';
      String title;
      if (view.title == null) {
        title = view.did.toUpperCase();
      } else {
        title = view.title;
      }
      section = '${section}    ${title} \n';
      section = '${section}  </caption> \n';
      List<Attribute> attributes;
      if (view.essentialOnly) {
        attributes = view.entity.concept.essentialAttributes;
      } else {
        attributes = view.entity.concept.attributes.toList();
      }
      String label;
      var value;
      for (Attribute attribute in attributes) {
        label = attribute.codeFirstLetterUpper;
        value = view.entity.getAttribute(attribute.code);
        section = '${section}  <tr> \n';
        section = '${section}    <th> \n';
        section = '${section}      ${label} \n';
        section = '${section}    </th> \n';
        section = '${section}    <td> \n';
        if (attribute.sensitive) {
          section = '${section}      ******** \n';
        } else if (attribute.type.code == 'DateTime') {
          if (value != null) {
            var formatter = new DateFormat('yyyy-MM-dd');
            String formattedValue = formatter.format(value);
            section = '${section}      ${formattedValue} \n';
          } else {
            section = '${section}      ${value} \n';
          }
        } else if (attribute.type.code == 'Uri') {
          section = '${section}      <a href="${value}">${attribute.code}</a> \n';
        } else if (attribute.type.code == 'Email') {
          section = '${section}      <a href="mailto:${value}">${attribute.code}</a> \n';
        } else {
          section = '${section}      ${value} \n';
        }
        section = '${section}    </td> \n';
        section = '${section}  </tr> \n';
      }
      section = '${section}</table> \n';
      section = '$section <br/> \n';

      /*
       * Each web page loaded in the browser has its own document object.
       * This object serves as an entry point to the web page's content
       * (the DOM tree, including elements such as <body> and <table> ) and
       * provides functionality global to the document (such as obtaining the
       * page's URL and creating new elements in the document).
       */
      view.document.querySelector('#${view.did}').setInnerHtml(
          section,
          validator: new NodeValidatorBuilder()
            ..allowHtml5()
            ..allowElement('a', attributes: ['href'])
      );
      hidden = false;
    }
  }

  void hide() {
    if (shown) {
      view.document.querySelector('#${view.did}').innerHtml = '';
      hidden = true;
    }
  }

}
