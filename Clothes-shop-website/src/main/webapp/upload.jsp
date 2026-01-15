<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Upload ảnh</title></head>
<body>
  <h2>Upload ảnh từ máy</h2>

  <form action="${pageContext.request.contextPath}/upload-image"
        method="post" enctype="multipart/form-data">
    <input type="file" name="image" accept="image/*" required>
    <button type="submit">Upload</button>
  </form>
</body>
</html>
