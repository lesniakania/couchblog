function(doc, meta) {
  if(doc.type == 'post' && doc.user_id) {
    emit(doc.user_id, null);
  }
}

