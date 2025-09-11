<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books Demo</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Card images bir xil balandlikda */
        .card-img-top {
            height: 250px;
            object-fit: cover; /* rasmni kesib bo‘lsa ham ratio saqlansin */
        }
        /* Card body flex, tugmalar pastda bo‘lsin */
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        /* Cardlarni bir xil balandlikda qilish uchun kolonka to‘liq balandlik */
        .card {
            height: 100%;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">Available Books (Demo)</h2>

    <div class="row">
        <!-- Book Card 1 - PDF -->
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="https://cdn.asaxiy.uz/asaxiy-content/product/items/desktop/059fdcd96baeb75112f09fa1dcc740cc2021120122341636835aGhqKlBtPO.jpg.webp"
                     class="card-img-top" alt="The Great Gatsby">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">The Great Gatsby</h5>
                        <p class="card-text text-muted">F. Scott Fitzgerald</p>
                        <p><span class="badge bg-info">PDF</span> 📄</p>
                        <p class="fw-bold">$9.99</p>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <a href="#" class="btn btn-sm btn-outline-secondary">Details</a>
                        <a href="#" class="btn btn-sm btn-primary">Read</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Book Card 2 - Audio -->
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="https://cdn.asaxiy.uz/asaxiy-content/product/items/desktop/059fdcd96baeb75112f09fa1dcc740cc2021120122341636835aGhqKlBtPO.jpg.webp"
                     class="card-img-top" alt="Atomic Habits">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Atomic Habits</h5>
                        <p class="card-text text-muted">James Clear</p>
                        <p><span class="badge bg-warning">AUDIO</span> 🎧</p>
                        <p class="fw-bold">$14.99</p>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <a href="#" class="btn btn-sm btn-outline-secondary">Details</a>
                        <a href="#" class="btn btn-sm btn-primary">Listen</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Book Card 3 - PDF -->
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="https://cdn.asaxiy.uz/asaxiy-content/product/items/desktop/059fdcd96baeb75112f09fa1dcc740cc2021120122341636835aGhqKlBtPO.jpg.webp"
                     class="card-img-top" alt="Harry Potter">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">Harry Potter</h5>
                        <p class="card-text text-muted">J.K. Rowling</p>
                        <p><span class="badge bg-info">PDF</span> 📄</p>
                        <p class="fw-bold">$19.99</p>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <a href="#" class="btn btn-sm btn-outline-secondary">Details</a>
                        <a href="#" class="btn btn-sm btn-primary">Read</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Book Card 4 - Audio -->
        <div class="col-md-3 mb-4">
            <div class="card shadow-sm h-100">
                <img src="https://cdn.asaxiy.uz/asaxiy-content/product/items/desktop/059fdcd96baeb75112f09fa1dcc740cc2021120122341636835aGhqKlBtPO.jpg.webp"
                     class="card-img-top" alt="1984">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title">1984</h5>
                        <p class="card-text text-muted">George Orwell</p>
                        <p><span class="badge bg-warning">AUDIO</span> 🎧</p>
                        <p class="fw-bold">$12.50</p>
                    </div>
                    <div class="d-flex justify-content-between mt-2">
                        <a href="#" class="btn btn-sm btn-outline-secondary">Details</a>
                        <a href="#" class="btn btn-sm btn-primary">Listen</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
