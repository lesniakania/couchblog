function(doc, meta) {
  if (doc.type == 'user') {
    emit(doc._id, null);
  }
}

