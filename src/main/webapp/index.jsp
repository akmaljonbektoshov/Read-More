<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sultan Bookstore — Library</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons (optional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* Kartalar va rasmlar bir xilda ko'rinsin */
        .card-img-top {
            height: 320px;
            object-fit: cover;
        }
        .card {
            height: 100%;
        }
        /* 2x2 tugma tartibi */
        .btn-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }
        footer.site-footer {
            background: #212529;
            color: #fff;
            padding: 20px 0;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp"><i class="bi bi-book"></i> SULTAN BOOKSTORE</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="library.jsp">Library</a></li>
                <li class="nav-item"><a class="nav-link" href="categories.jsp">Categories</a></li>
            </ul>

            <form class="d-flex me-3" role="search" action="search.jsp" method="get">
                <input class="form-control me-2" type="search" name="q" placeholder="Search books..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>

            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="auth/login.jsp">Sign In</a></li>
                <li class="nav-item"><a class="nav-link" href="auth/register.jsp">Sign Up</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- MAIN CONTENT -->
<div class="container my-5">
    <h1 class="text-center mb-4 fw-bold">Sultan Bookstore — Tavsiya kitoblar</h1>

    <div class="row g-4">

        <!-- 1. Boy ota va kambagal ota (Rich Dad, Poor Dad) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://covers.openlibrary.org/b/isbn/1612680178-L.jpg"
                     class="card-img-top" alt="Rich Dad Poor Dad">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Boy ota va kambagal ota</h5>
                    <p class="text-muted mb-3">Robert Kiyosaki</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=Rich+Dad+Poor+Dad+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://www.amazon.com/Rich-Dad-Poor-What-Middle/dp/1612680178" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://openlibrary.org/works/OL2010879W/Rich_Dad_Poor_Dad" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 2. Ferrarisini sotgan Rohin (The Monk Who Sold His Ferrari) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://covers.openlibrary.org/b/isbn/0062515616-L.jpg"
                     class="card-img-top" alt="The Monk Who Sold His Ferrari">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Ferrarisini sotgan Rohin</h5>
                    <p class="text-muted mb-3">Robin S. Sharma</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=The+Monk+Who+Sold+His+Ferrari+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://www.amazon.com/Monk-Who-Sold-His-Ferrari/dp/0062515616" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://openlibrary.org/works/OL1854817W/The_monk_who_sold_his_Ferrari" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3. Daftar hoshiyasidagi bitiklar (Oʻtkir Hoshimov) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://kitobxon.com/img_knigi/5979.jpg"
                     class="card-img-top" alt="Daftar hoshiyasidagi bitiklar">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Daftar hoshiyasidagi bitiklar</h5>
                    <p class="text-muted mb-3">O'tkir Hoshimov</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=Daftar+hoshiyasidagi+bitiklar+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://mutolaa.com/uz/book/daftar-hoshiyasidagi-bitiklar" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://mutolaa.com/uz/book/daftar-hoshiyasidagi-bitiklar" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 4. Sariq devni minib (Xudoyberdi To'xtaboyev) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://books.google.com/books/content?id=8j0DzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
                     class="card-img-top" alt="Sariq devni minib">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Sariq devni minib</h5>
                    <p class="text-muted mb-3">Xudoyberdi To'xtaboyev</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=Sariq+devni+minib+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://kitobxon.com/kitoblar/sariq-devni-minib" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://books.google.com/books/about/Sariq_devni_minib.html?id=8j0DzgEACAAJ" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 5. Nisi (Jen Sincero — You Are a Badass) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://covers.openlibrary.org/b/isbn/0762447699-L.jpg"
                     class="card-img-top" alt="You Are a Badass">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Nisi</h5>
                    <p class="text-muted mb-3">Jen Sincero</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=You+Are+a+Badass+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://www.amazon.com/You-Are-Badass-Self-Esteem-Transformation/dp/0762447699" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://openlibrary.org/works/OL28816509W/You_Are_a_Badass%C2%AE" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 6. Do'st ortirish san'ati (Dale Carnegie) -->
        <div class="col-12 col-sm-6 col-md-4">
            <div class="card shadow-sm h-100">
                <img src="https://covers.openlibrary.org/b/isbn/0671027034-L.jpg"
                     class="card-img-top" alt="How to Win Friends and Influence People">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title">Do'st ortirish san'ati</h5>
                    <p class="text-muted mb-3">Dale Carnegie</p>

                    <div class="btn-grid mt-auto">
                        <a class="btn btn-outline-primary" href="https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf" target="_blank" rel="noopener">Open PDF</a>
                        <a class="btn btn-outline-secondary" href="https://www.youtube.com/results?search_query=How+to+Win+Friends+and+Influence+People+audiobook" target="_blank" rel="noopener">Listen Music</a>
                        <a class="btn btn-outline-success" href="https://www.amazon.com/How-Win-Friends-Influence-People/dp/0671027034" target="_blank" rel="noopener">Buy Book</a>
                        <a class="btn btn-outline-info" href="https://openlibrary.org/books/OL25301206M/How_to_win_friends_and_influence_people" target="_blank" rel="noopener">Details</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer class="site-footer mt-5">
    <div class="container text-center">
        <p class="mb-1">© 2025 Read-More. Barcha huquqlar himoyalangan.</p>
        <small class="text-muted">Designed with ❤️ by Sultan</small>
    </div>
</footer>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
