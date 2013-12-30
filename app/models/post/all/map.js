function(doc, meta) {
  if (doc.type == 'post') {
    emit(doc._id, null);
  }
}

