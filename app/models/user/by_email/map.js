function(doc, meta) {
  if (doc.type == 'user' && doc.email) {
    emit(doc.email, 1);
  }
}
