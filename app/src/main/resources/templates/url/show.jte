@import hexlet.code.dto.urls.UrlPage
@import hexlet.code.util.NamedRoutes

@param UrlPage page

@template.layout.page(
page = page,
content = @`

<div class="container-lg mt-5">

    <h1>Site: ${page.getUrl().getName()}</h1>

    <table class="table table-bordered table-hover mt-3">
        <tbody>
            <tr>
                <td>ID</td>
                <td>${page.getUrl().getId()}</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>${page.getUrl().getName()}</td>
            </tr>
            <tr>
                <td>Created at</td>
                <td>${page.getUrl().getCreatedAt().toString().substring(0, 19)}</td>
            </tr>
        </tbody>
    </table>

    <h2 class="mt-5">Checks</h2>

    <form method="post" action="${NamedRoutes.urlChecksPath(page.getUrl().getId())}">
        <button type="submit" class="btn btn-primary">Run check</button>
    </form>

    <table class="table table-bordered table-hover mt-3">

        <thead>
            <tr>
                <th class="col-1">ID</th>
                <th class="col-1">Response code</th>
                <th>Title</th>
                <th>H1</th>
                <th>Description</th>
                <th class="col-2">Date of inspection</th>
            </tr>
        </thead>

        <tbody>

            @for(var check : page.getListChecks())
            <tr>
                <td>${check.getId()}</td>
                <td>${check.getStatusCode()}</td>
                <td>${check.getTitle()}</td>
                <td>${check.getH1()}</td>
                <td>${check.getDescription()}</td>
                <td>${check.getCreatedAt().toString().substring(0, 19)}</td>
            </tr>
            @endfor

        </tbody>

    </table>
</div>

`
)
