<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin — Kitoblarni boshqarish</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        .thumb {
            width: 64px;
            height: 88px;
            object-fit: cover;
            border-radius: 4px;
            background: #f1f1f1;
            display: inline-block;
            text-align: center;
            line-height: 88px;
            color: #777;
            font-size: 12px;
        }
        .desc-small { max-width: 320px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        footer.site-footer { background: #212529; color: #fff; padding: 12px 0; margin-top: 24px; }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/books">Admin — Books</a>
        <div>
            <a class="btn btn-sm btn-outline-light me-2" href="${pageContext.request.contextPath}/">Saytga o‘tish</a>
            <a class="btn btn-sm btn-outline-light" href="${pageContext.request.contextPath}/auth/logout">Chiqish</a>
        </div>
    </div>
</nav>

<div class="container my-4">
    <!-- header -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="mb-0">Kitoblarni boshqarish</h4>
        <div class="d-flex align-items-center">
            <form class="d-flex" action="${pageContext.request.contextPath}/admin/books" method="get">
                <input name="q" value="${fn:escapeXml(param.q)}" class="form-control form-control-sm me-2" placeholder="Title yoki author bo‘yicha qidirish">
                <button class="btn btn-sm btn-outline-primary me-3" type="submit"><i class="bi bi-search"></i> Qidir</button>
            </form>
            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addBookModal">
                <i class="bi bi-plus-lg"></i> Kitob qo'shish
            </button>
        </div>
    </div>

    <!-- table -->
    <div class="card shadow-sm">
        <div class="card-body p-0 table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                <tr>
                    <th style="width:72px"></th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th style="width:110px">Price</th>
                    <th style="width:320px">Description</th>
                    <th style="width:220px">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty books}">
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty book.attachments and fn:length(book.attachments) > 0}">
                                            <img src="${book.attachments[0].url}"
                                                 alt="${book.title}"
                                                 class="thumb"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="thumb">No Image</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <strong>${fn:escapeXml(book.title)}</strong><br/>
                                    <small class="text-muted">${fn:escapeXml(book.author)}</small>
                                </td>

                                <td>${fn:escapeXml(book.author)}</td>
                                <td>${fn:escapeXml(book.genre)}</td>

                                <td>
                                    <c:choose>
                                        <c:when test="${not empty book.price}">
                                            ${book.price}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td class="desc-small">
                                    <c:choose>
                                        <c:when test="${not empty book.description}">
                                            ${fn:escapeXml(book.description)}
                                        </c:when>
                                        <c:otherwise>
                                            -
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="d-flex gap-2">
                                        <button class="btn btn-sm btn-outline-warning editBtn"
                                                data-id="${book.id}"
                                                data-title="${fn:escapeXml(book.title)}"
                                                data-author="${fn:escapeXml(book.author)}"
                                                data-genre="${fn:escapeXml(book.genre)}"
                                                data-price="${book.price}"
                                                data-description="${fn:escapeXml(book.description)}"
                                                data-bs-toggle="modal" data-bs-target="#editBookModal">
                                            <i class="bi bi-pencil"></i> Edit
                                        </button>

                                        <button class="btn btn-sm btn-outline-danger deleteBtn"
                                                data-id="${book.id}"
                                                data-title="${fn:escapeXml(book.title)}"
                                                data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                                            <i class="bi bi-trash"></i> Delete
                                        </button>

                                        <a class="btn btn-sm btn-outline-info" href="">
                                            <i class="bi bi-eye"></i> View
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7" class="text-center py-4 text-muted">Kitoblar topilmadi.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <!-- pagination -->
        <div class="card-footer d-flex justify-content-between align-items-center">
            <div>
                <small class="text-muted">Page <strong>${currentPage}</strong> of <strong>${totalPages}</strong></small>
            </div>
            <nav>
                <ul class="pagination mb-0">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/books?page=${currentPage - 1}&q=${fn:escapeXml(param.q)}">«</a>
                    </li>

                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/admin/books?page=${i}&q=${fn:escapeXml(param.q)}">${i}</a>
                        </li>
                    </c:forEach>

                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/books?page=${currentPage + 1}&q=${fn:escapeXml(param.q)}">»</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Add Book Modal -->
<div class="modal fade" id="addBookModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form action="${pageContext.request.contextPath}/admin/books" method="post" class="modal-content">
            <input type="hidden" name="action" value="create"/>
            <input type="hidden" name="currentPage" value="${currentPage}"/>
            <div class="modal-header">
                <h5 class="modal-title">Yangi kitob qo'shish</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label">Title</label>
                        <input name="title" type="text" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Author</label>
                        <input name="author" type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Genre</label>
                        <input name="genre" type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input name="price" type="text" class="form-control" placeholder="e.g. 12.99">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea name="description" rows="4" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Bekor qilish</button>
                <button type="submit" class="btn btn-primary">Saqlash</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Book Modal -->
<div class="modal fade" id="editBookModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <form id="editBookForm" action="${pageContext.request.contextPath}/admin/books" method="post" class="modal-content">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="id" id="edit-id"/>
            <input type="hidden" name="currentPage" value="${currentPage}"/>
            <div class="modal-header">
                <h5 class="modal-title">Kitobni tahrirlash</h5>
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
                        <input id="edit-author" name="author" type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Genre</label>
                        <input id="edit-genre" name="genre" type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Price</label>
                        <input id="edit-price" name="price" type="text" class="form-control">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Description</label>
                        <textarea id="edit-description" name="description" rows="4" class="form-control"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Bekor qilish</button>
                <button type="submit" class="btn btn-warning">Yangilash</button>
            </div>
        </form>
    </div>
</div>

<!-- Delete Confirm Modal -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <form id="deleteForm" action="${pageContext.request.contextPath}/admin/books" method="post" class="modal-content">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="id" id="delete-id"/>
            <input type="hidden" name="currentPage" value="${currentPage}"/>
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title">Kitob o‘chirilsinmi?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Haqiqatan ham <strong id="delete-title"></strong> kitobini o‘chirishni xohlaysizmi?</p>
                <small class="text-muted">Bu amalni qaytarib bo‘lmaydi.</small>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Bekor</button>
                <button type="submit" class="btn btn-danger">O‘chirish</button>
            </div>
        </form>
    </div>
</div>

<footer class="site-footer">
    <div class="container text-center">
        <small>© 2025 Read-More — Admin</small>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- populate edit & delete modals -->
<script>
    document.addEventListener('click', function (ev) {
        const target = ev.target.closest('.editBtn, .deleteBtn');
        if (!target) return;

        if (target.classList.contains('editBtn')) {
            document.getElementById('edit-id').value = target.dataset.id || '';
            document.getElementById('edit-title').value = target.dataset.title || '';
            document.getElementById('edit-author').value = target.dataset.author || '';
            document.getElementById('edit-genre').value = target.dataset.genre || '';
            document.getElementById('edit-price').value = target.dataset.price || '';
            document.getElementById('edit-description').value = target.dataset.description || '';
        }

        if (target.classList.contains('deleteBtn')) {
            document.getElementById('delete-id').value = target.dataset.id || '';
            document.getElementById('delete-title').textContent = target.dataset.title || '';
        }
    });
</script>
</body>
</html>
