<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="eng">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin — Manage Books</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap icons (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        .card-img-thumb {
            width: 56px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
        }
        .table-wrap { overflow-x: auto; }
        footer.site-footer { background: #212529; color: #fff; padding: 12px 0; margin-top: 24px; }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/books">Admin Panel — Books</a>
        <div>
            <a href="${pageContext.request.contextPath}/" class="btn btn-outline-light btn-sm me-2">Go to Site</a>
            <a href="${pageContext.request.contextPath}/auth/logout" class="btn btn-outline-light btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="mb-0">Books management</h3>
        <div>
            <form class="d-inline-flex" action="${pageContext.request.contextPath}/admin/books" method="get">
                <input class="form-control form-control-sm me-2" name="q" placeholder="Search by title or author" value="${param.q}">
                <button class="btn btn-sm btn-outline-primary" type="submit"><i class="bi bi-search"></i> Search</button>
            </form>
            <button class="btn btn-primary btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#addBookModal">
                <i class="bi bi-plus-lg"></i> Add Book
            </button>
        </div>
    </div>

    <!-- Table -->
    <div class="card shadow-sm">
        <div class="card-body table-wrap p-0">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                <tr>
                    <th style="width:56px"></th>
                    <th>Title</th>
                    <th>Author</th>
                    <th style="width:120px">Published</th>
                    <th style="width:100px">Price</th>
                    <th style="width:110px">Status</th>
                    <th style="width:220px">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty books}">
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td>
                                    <img src="${book.imageUrl}" alt="${book.title}" class="card-img-thumb">
                                </td>
                                <td>
                                    <strong>${book.title}</strong><br/>
                                    <small class="text-muted">${fn:substring(book.description,0,80)}</small>
                                </td>
                                <td>${book.author}</td>
                                <td><small class="text-muted">${book.publishedAt}</small></td>
                                <td>${book.price}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${book.status == 'AVAILABLE'}">
                                            <span class="badge bg-success">Available</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Unavailable</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <!-- Action buttons: Edit, Delete, View, Manage Copies (example) -->
                                    <div class="d-flex gap-2">
                                        <!-- Edit: Put book data in data- attributes to populate modal -->
                                        <button class="btn btn-sm btn-outline-warning editBtn"
                                                data-id="${book.id}"
                                                data-title="${fn:escapeXml(book.title)}"
                                                data-author="${fn:escapeXml(book.author)}"
                                                data-price="${book.price}"
                                                data-image="${book.imageUrl}"
                                                data-pdf="${book.pdfUrl}"
                                                data-status="${book.status}"
                                                data-published="${book.publishedAt}"
                                                data-description="${fn:escapeXml(book.description)}"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editBookModal">
                                            <i class="bi bi-pencil"></i> Edit
                                        </button>

                                        <!-- Delete: show confirm modal -->
                                        <button class="btn btn-sm btn-outline-danger deleteBtn"
                                                data-id="${book.id}"
                                                data-title="${book.title}"
                                                data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>

                                        <a href="${pageContext.request.contextPath}/book?id=${book.id}" class="btn btn-sm btn-outline-info">
                                            <i class="bi bi-eye"></i> View
                                        </a>

                                        <a href="${book.pdfUrl}" target="_blank" class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-file-earmark-pdf"></i> PDF
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr><td colspan="7" class="text-center py-4 text-muted">No books found.</td></tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="card-footer d-flex justify-content-between align-items-center">
            <div>
                <small class="text-muted">Page <strong>${currentPage}</strong> of <strong>${totalPages}</strong></small>
            </div>
            <nav>
                <ul class="pagination mb-0">
                    <li class="page-item <c:if test='${currentPage==1}'>disabled</c:if>'">
                        <a class="page-link" href="?page=${currentPage-1}&q=${param.q}">«</a>
                    </li>

                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i==currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}&q=${param.q}">${i}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item <c:if test='${currentPage==totalPages}'>disabled</c:if>'">
                        <a class="page-link" href="?page=${currentPage+1}&q=${param.q}">»</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Add Book Modal -->
<div class="modal fade" id="addBookModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form action="${pageContext.request.contextPath}/admin/book/create" method="post" class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Fields -->
                <div class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label">Title</label>
                        <input name="title" type="text" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Author</label>
                        <input name="author" type="text" class="form-control" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input name="price" type="number" step="0.01" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="AVAILABLE">AVAILABLE</option>
                            <option value="UNAVAILABLE">UNAVAILABLE</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Published (yyyy-mm-dd)</label>
                        <input name="publishedAt" type="date" class="form-control">
                    </div>

                    <div class="col-12">
                        <label class="form-label">Image URL (cover)</label>
                        <input name="imageUrl" type="url" class="form-control" placeholder="https://...">
                    </div>

                    <div class="col-12">
                        <label class="form-label">PDF URL</label>
                        <input name="pdfUrl" type="url" class="form-control" placeholder="https://...">
                    </div>

                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea name="description" rows="4" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Create Book</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Book Modal -->
<div class="modal fade" id="editBookModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form id="editBookForm" action="${pageContext.request.contextPath}/admin/book/update" method="post" class="modal-content">
            <input type="hidden" name="id" id="edit-id">
            <div class="modal-header">
                <h5 class="modal-title">Edit Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label">Title</label>
                        <input id="edit-title" name="title" type="text" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Author</label>
                        <input id="edit-author" name="author" type="text" class="form-control" required>
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input id="edit-price" name="price" type="number" step="0.01" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Status</label>
                        <select id="edit-status" name="status" class="form-select">
                            <option value="AVAILABLE">AVAILABLE</option>
                            <option value="UNAVAILABLE">UNAVAILABLE</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Published</label>
                        <input id="edit-published" name="publishedAt" type="date" class="form-control">
                    </div>

                    <div class="col-12">
                        <label class="form-label">Image URL</label>
                        <input id="edit-image" name="imageUrl" type="url" class="form-control">
                    </div>

                    <div class="col-12">
                        <label class="form-label">PDF URL</label>
                        <input id="edit-pdf" name="pdfUrl" type="url" class="form-control">
                    </div>

                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea id="edit-description" name="description" rows="4" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-warning">Update Book</button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Confirm Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form id="deleteForm" action="${pageContext.request.contextPath}/admin/book/delete" method="post" class="modal-content">
            <input type="hidden" name="id" id="delete-id">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Delete Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete book: <strong id="delete-title"></strong> ?</p>
                <small class="text-muted">This action cannot be undone.</small>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger">Delete</button>
            </div>
        </form>
    </div>
</div>

<footer class="site-footer">
    <div class="container text-center">
        <small>© 2025 Read-More — Admin</small>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Small JS to populate edit/delete modals -->
<script>
    document.addEventListener('click', function (e) {
        const target = e.target.closest('.editBtn, .deleteBtn');
        if (!target) return;

        // Edit
        if (target.classList.contains('editBtn')) {
            document.getElementById('edit-id').value = target.dataset.id;
            document.getElementById('edit-title').value = target.dataset.title;
            document.getElementById('edit-author').value = target.dataset.author;
            document.getElementById('edit-price').value = target.dataset.price;
            document.getElementById('edit-image').value = target.dataset.image;
            document.getElementById('edit-pdf').value = target.dataset.pdf;
            document.getElementById('edit-status').value = target.dataset.status;
            document.getElementById('edit-published').value = target.dataset.published;
            document.getElementById('edit-description').value = target.dataset.description;
        }

        // Delete
        if (target.classList.contains('deleteBtn')) {
            document.getElementById('delete-id').value = target.dataset.id;
            document.getElementById('delete-title').textContent = target.dataset.title;
        }
    });
</script>

</body>
</html>
