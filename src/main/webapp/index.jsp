<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bookstore Navbar Demo</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- Bookstore Navbar -->
<nav class="navbar navbar-expand-lg" style="background-color: #1f2937 !important; min-height: 70px;">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand d-flex align-items-center" href="index.jsp" style="color: white !important;">
            <div class="me-2 p-2 rounded" style="background-color: #f59e0b; color: #1f2937;">
                <!-- Book Icon -->
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
                    <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
                </svg>
            </div>
            <span class="fw-bold fs-5" style="color: white !important;">BOOKSTORE</span>
        </a>

        <!-- Mobile toggle button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" style="border-color: white;">
            <span style="background-image: url('data:image/svg+xml,%3csvg xmlns=%27http://www.w3.org/2000/svg%27 viewBox=%270 0 30 30%27%3e%3cpath stroke=%27rgba%28255, 255, 255, 1%29%27 stroke-linecap=%27round%27 stroke-miterlimit=%2710%27 stroke-width=%272%27 d=%27M4 7h22M4 15h22M4 23h22%27/%3e%3c/svg%3e'); width: 1em; height: 1em; display: inline-block;"></span>
        </button>

        <!-- Navigation Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="home.jsp" style="color: white !important;">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="library.jsp" style="color: white !important;">LIBRARY</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="categories.jsp" style="color: white !important;">CATEGORIES</a>
                </li>

                <!-- More Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-semibold" href="#" role="button" data-bs-toggle="dropdown" style="color: white !important;">
                        MORE
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="about.jsp">About Us</a></li>
                        <li><a class="dropdown-item" href="contact.jsp">Contact Us</a></li>
                        <li><a class="dropdown-item" href="help.jsp">Help</a></li>
                    </ul>
                </li>
            </ul>

            <!-- Right Side Actions -->
            <div class="d-flex align-items-center">
                <!-- Search -->
                <div class="me-3">
                    <div class="input-group" id="searchContainer" style="display: none; width: 250px;">
                        <input type="text" class="form-control" placeholder="Search books..." id="searchInput">
                        <button class="btn" type="button" onclick="performSearch()" style="border: 1px solid white; color: white; background-color: transparent;">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <circle cx="11" cy="11" r="8"></circle>
                                <path d="m21 21-4.35-4.35"></path>
                            </svg>
                        </button>
                    </div>
                    <button class="btn p-2" id="searchToggle" onclick="toggleSearch()" style="color: white !important; background-color: transparent !important; border: none;">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="11" cy="11" r="8"></circle>
                            <path d="m21 21-4.35-4.35"></path>
                        </svg>
                    </button>
                </div>

                <!-- User Cabinet -->
                <div class="dropdown">
                    <button class="btn p-2 dropdown-toggle" data-bs-toggle="dropdown" style="color: white !important; background-color: transparent !important; border: none;">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="/login">Sign In</a></li>
                        <li><a class="dropdown-item" href="/register">Sign Up</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- Demo Content -->
<div class="container mt-4">
    <h1>Bookstore Navbar - High Contrast Version</h1>
    <p>This navbar uses a dark gray background (#1f2937) with white text for maximum contrast compliance.</p>
</div>

<!-- Bootstrap JavaScript Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script>
    function toggleSearch() {
        const searchContainer = document.getElementById("searchContainer");
        const searchToggle = document.getElementById("searchToggle");

        if (searchContainer.style.display === "none" || searchContainer.style.display === "") {
            searchContainer.style.display = "block";
            searchToggle.style.display = "none";
            document.getElementById("searchInput").focus();
        } else {
            searchContainer.style.display = "none";
            searchToggle.style.display = "block";
        }
    }

    function performSearch() {
        const query = document.getElementById("searchInput").value.trim();
        if (query) {
            alert("Searching for: " + query);
            // window.location.href = "search.jsp?q=" + encodeURIComponent(query);
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        const searchInput = document.getElementById("searchInput");
        if (searchInput) {
            searchInput.addEventListener("keypress", function(event) {
                if (event.key === "Enter") {
                    performSearch();
                }
            });

            document.addEventListener("click", function(event) {
                const searchContainer = document.getElementById("searchContainer");
                const searchToggle = document.getElementById("searchToggle");

                if (!event.target.closest("#searchContainer") && !event.target.closest("#searchToggle")) {
                    searchContainer.style.display = "none";
                    searchToggle.style.display = "block";
                }
            });
        }
    });
</script>
</body>
</html>
