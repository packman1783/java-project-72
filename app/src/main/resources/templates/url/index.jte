@import hexlet.code.dto.urls.UrlsPage
@import hexlet.code.util.NamedRoutes

@param UrlsPage page

@template.layout.page(
page =page,
content = @`

<div class="container-lg mt-5">

    <h1>Sites</h1>

    <table class="table table-bordered table-hover mt-3">
        <thead>
            <tr>
                <th class="col-1">ID</th>
                <th>Name</th>
                <th>Last check</th>
                <th>Response code</th>
            </tr>
        </thead>

        <tbody>

        @for(var url : page.getUrls())
            <tr>
                <td>
                    ${url.getId()}
                </td>
                <td>
                    <a href="${NamedRoutes.urlPath(url.getId())}">
                        ${url.getName()}
                    </a>
                </td>
                <td>
                    @if(page.getMapChecks().get(url.getId()) != null)
                        ${page.getMapChecks().get(url.getId()).getCreatedAt().toString().substring(0, 19)}
                    @endif
                </td>
                <td>
                    @if(page.getMapChecks().get(url.getId()) != null)
                        ${page.getMapChecks().get(url.getId()).getStatusCode()}
                    @endif
                </td>
            </tr>
        @endfor

        </tbody>

    </table>
</div>

`
)
